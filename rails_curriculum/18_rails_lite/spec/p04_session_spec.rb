require 'rack'
require 'session'
require 'controller_base'

describe Session do
  let(:req) { Rack::Request.new({ 'rack.input' => {} }) }
  let(:res) { Rack::Response.new([], '200', {}) }
  let(:cook) { {'_rails_lite_app' => { 'xyz' => 'abc' }.to_json} }

  it 'deserializes json cookie if one exists' do
    req.cookies.merge!(cook)
    session = Session.new(req)
    expect(session['xyz']).to eq('abc')
  end

  describe '#store_session' do
    context 'without cookies in request' do
      before(:each) do
        session = Session.new(req)
        session['first_key'] = 'first_val'
        session.store_session(res)
      end

      it 'adds new cookie with \'_rails_lite_app\' name to response' do
        cookie_str = res.headers['Set-Cookie']
        cookie = Rack::Utils.parse_query(cookie_str)
        expect(cookie['_rails_lite_app']).not_to be_nil
      end

      it 'stores the cookie in json format' do
        cookie_str = res.headers['Set-Cookie']
        cookie = Rack::Utils.parse_query(cookie_str)
        cookie_val = cookie['_rails_lite_app']
        cookie_hash = JSON.parse(cookie_val)
        expect(cookie_hash).to be_instance_of(Hash)
      end
    end

    context 'with cookies in request' do
      before(:each) do
        cook = {'_rails_lite_app' => { 'pho' => 'soup' }.to_json }
        req.cookies.merge!(cook)
      end

      it 'reads the pre-existing cookie data into hash' do
        session = Session.new(req)
        expect(session['pho']).to eq('soup')
      end

      it 'saves new and old data to the cookie' do
        session = Session.new(req)
        session['machine'] = 'mocha'
        session.store_session(res)
        cookie_str = res['Set-Cookie']
        cookie = Rack::Utils.parse_query(cookie_str)
        cookie_val = cookie['_rails_lite_app']
        cookie_hash = JSON.parse(cookie_val)
        expect(cookie_hash['pho']).to eq('soup')
        expect(cookie_hash['machine']).to eq('mocha')
      end
    end
  end
end

describe ControllerBase do
  before(:all) do
    class CatsController < ControllerBase
    end
  end
  after(:all) { Object.send(:remove_const, 'CatsController') }

  let(:req) { Rack::Request.new({'rack.input' => {}}) }
  let(:res) { Rack::Response.new([], '200', {}) }
  let(:cats_controller) { CatsController.new(req, res) }

  describe '#session' do
    it 'returns a session instance' do
      expect(cats_controller.session).to be_a(Session)
    end

    it 'returns the same instance on successive invocations' do
      first_result = cats_controller.session
      expect(cats_controller.session).to be(first_result)
    end
  end

  shared_examples_for 'storing session data' do
    it 'should store the session data' do
      cats_controller.session['test_key'] = 'test_value'
      cats_controller.send(method, *args)
      cookie_str = res['Set-Cookie']
      cookie = Rack::Utils.parse_query(cookie_str)
      cookie_val = cookie['_rails_lite_app']
      cookie_hash = JSON.parse(cookie_val)
      expect(cookie_hash['test_key']).to eq('test_value')
    end
  end

  describe '#render_content' do
    let(:method) { :render_content }
    let(:args) { ['test', 'text/plain'] }
    include_examples 'storing session data'
  end

  describe '#redirect_to' do
    let(:method) { :redirect_to }
    let(:args) { ['http://appacademy.io'] }
    include_examples 'storing session data'
  end
end
