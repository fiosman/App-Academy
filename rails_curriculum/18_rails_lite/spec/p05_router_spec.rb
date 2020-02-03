require 'rack'
require 'router'
require 'controller_base'

describe Route do
  let(:req) { Rack::Request.new({ 'rack.input' => {} }) }
  let(:res) { Rack::MockResponse.new('200', {}, []) }

  before(:each) do
    allow(req).to receive(:request_method).and_return('GET')
  end

  describe '#matches?' do
    it 'matches simple regular expression' do
      index_route = Route.new(Regexp.new('^/users$'), :get, 'x', :x)
      allow(req).to receive(:path) { '/users' }
      expect(index_route.matches?(req)).to be_truthy
    end

    it 'matches regular expression with capture' do
      index_route = Route.new(Regexp.new('^/users/(?<id>\\d+)$'), :get, 'x', :x)
      allow(req).to receive(:path) { '/users/1' }
      expect(index_route.matches?(req)).to be_truthy
    end

    it 'correctly doesn\'t match regular expression with capture' do
      index_route = Route.new(Regexp.new('^/users/(?<id>\\d+)$'), :get, 'UsersController', :index)
      allow(req).to receive(:path) { '/statuses/1' }
      expect(index_route.matches?(req)).to be_falsey
    end
  end

  describe '#run' do
    before(:all) { class DummyController; end }
    after(:all) { Object.send(:remove_const, 'DummyController') }

    it 'instantiates controller and invokes action' do
      # reader beware. hairy adventures ahead.
      # this is really checking way too much implementation,
      # but tests the approach recommended in the project
      allow(req).to receive(:path) { '/users' }

      dummy_controller_class = DummyController
      dummy_controller_instance = dummy_controller_class.new
      allow(dummy_controller_instance).to receive(:invoke_action)
      allow(dummy_controller_class).to receive(:new).with(req, res, {}) do
        dummy_controller_instance
      end
      expect(dummy_controller_instance).to receive(:invoke_action)
      index_route = Route.new(Regexp.new('^/users$'), :get, dummy_controller_class, :index)
      index_route.run(req, res)
    end
  end
end

describe Router do
  let(:req) { Rack::Request.new({'rack-input' => {}}) }
  let(:res) { Rack::MockResponse.new('200', {}, []) }

  describe '#add_route' do
    it 'adds a route' do
      subject.add_route(1, 2, 3, 4)
      expect(subject.routes.count).to eq(1)
      subject.add_route(1, 2, 3, 4)
      subject.add_route(1, 2, 3, 4)
      expect(subject.routes.count).to eq(3)
    end
  end

  describe '#match' do
    it 'matches a correct route' do
      subject.add_route(Regexp.new('^/users$'), :get, :x, :x)
      allow(req).to receive(:path) { '/users' }
      allow(req).to receive(:request_method) { 'GET' }
      matched = subject.match(req)
      expect(matched).not_to be_nil
    end

    it 'doesn\'t match an incorrect route' do
      subject.add_route(Regexp.new('^/users$'), :get, :x, :x)
      allow(req).to receive(:path) { '/incorrect_path' }
      allow(req).to receive(:request_method) { 'GET' }
      matched = subject.match(req)
      expect(matched).to be_nil
    end
  end

  describe '#run' do
    it 'sets status to 404 if no route is found' do
      subject.add_route(Regexp.new('^/users$'), :get, :x, :x)
      allow(req).to receive(:path).and_return('/incorrect_path')
      allow(req).to receive(:request_method).and_return('GET')
      subject.run(req, res)
      expect(res.status).to eq(404)
    end
  end

  describe 'http method (get, put, post, delete)' do
    it 'adds methods get, put, post and delete' do
      router = Router.new
      expect((router.methods - Class.new.methods)).to include(:get)
      expect((router.methods - Class.new.methods)).to include(:put)
      expect((router.methods - Class.new.methods)).to include(:post)
      expect((router.methods - Class.new.methods)).to include(:delete)
    end

    it 'adds a route when an http method method is called' do
      router = Router.new
      router.get Regexp.new('^/users$'), ControllerBase, :index
      expect(router.routes.count).to eq(1)
    end
  end

  describe '#draw' do
    it 'calls http method methods with the route information to add the route' do
      index_route = double('route')
      post_route = double('route')

      routes = Proc.new do
        get index_route
        post post_route
      end

      router = Router.new

      expect(router).to receive(:get).with(index_route)
      expect(router).to receive(:post).with(post_route)

      router.draw(&routes)
    end
  end
end

describe 'ControllerBase#initialize' do
  before(:all) do
    class CatsController < ControllerBase
      def index
        @cats = ['Gizmo']
      end
    end
  end

  after(:all) { Object.send(:remove_const, 'CatsController') }

  let(:req) { Rack::Request.new({'rack.input' => {}}) }
  let(:res) { Rack::MockResponse.new('200', {}, []) }
  
  let(:cats_controller) do 
    req.update_param('foo', 'bar')
    CatsController.new(req, res, { 'key' => 'val' } ) 
  end

  context '#initialize' do
    it 'includes route params in the params object' do
      expect(cats_controller.params['key']).to eq('val')
    end
    it 'merges route params with the request params' do
      expect(cats_controller.params['key']).to eq('val')
      expect(cats_controller.params['foo']).to eq('bar')
    end
  end
end
