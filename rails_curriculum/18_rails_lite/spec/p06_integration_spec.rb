require 'rack'
require 'controller_base'
require 'router'

describe 'the symphony of things' do
  let(:req) { Rack::Request.new({'rack.input' => ''}) }
  let(:res) { Rack::MockResponse.new('200', [], {}) }

  before(:all) do
    class Ctrlr < ControllerBase
      def route_render
        render_content('testing', 'text/html')
      end

      def route_does_params
        render_content("got ##{params['id']}", 'text/text')
      end

      def update_session
        session['token'] = 'testing'
        render_content('hi', 'text/html')
      end
    end
  end
  after(:all) { Object.send(:remove_const, 'Ctrlr') }

  describe 'routes and params' do
    it 'route instantiates controller and calls invoke action' do
      route = Route.new(Regexp.new('^/statuses/(?<id>\\d+)$'), :get, Ctrlr, :route_render)
      allow(req).to receive(:path) { '/statuses/1' }
      allow(req).to receive(:request_method) { 'GET' }
      route.run(req, res)
      expect(res.body).to eq('testing')
    end

    it 'route adds to params' do
      route = Route.new(Regexp.new('^/statuses/(?<id>\\d+)$'), :get, Ctrlr, :route_does_params)
      allow(req).to receive(:path) { '/statuses/1' }
      allow(req).to receive(:request_method) { 'GET' }
      route.run(req, res)
      expect(res.body).to eq('got #1')
    end
  end

  describe 'controller sessions' do
    let(:ctrlr) { Ctrlr.new(req, res) }

    it 'exposes a session via the session method' do
      expect(ctrlr.session).to be_instance_of(Session)
    end

    it 'saves the session after rendering content' do
      ctrlr.update_session
      # Currently broken when flash is used. Need to store flash in the cookie
      # or change this spec.
      expect(res.headers['Set-Cookie']).to_not be_empty
      cookie_str = res.headers['Set-Cookie']
      cookie_val = Rack::Utils.parse_query(cookie_str)
      cookie_str = cookie_val['_rails_lite_app']
      cookie_hash = JSON.parse(cookie_str)
      expect(cookie_hash['token']).to eq('testing')
    end
  end
end
