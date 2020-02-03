require 'rack'
require 'controller_base'
require 'router'

describe ControllerBase do
  let(:req) { Rack::Request.new({'rack.input' => {}, 'REQUEST_METHOD' => 'GET'}) }
  let(:res) { Rack::Response.new([], '200', {}) }
  let(:controller_base) { ControllerBase.new(req, res) }

  describe '#form_authenticity_token' do
    it 'adds new cookie with \'authenticity_token\' name to response' do
      controller_base.form_authenticity_token
      cookie_str = res.headers['Set-Cookie']
      cookie = Rack::Utils.parse_query(cookie_str)
      expect(cookie['authenticity_token']).not_to be_nil
    end

    it 'returns the same token set in the cookie' do
      token = controller_base.form_authenticity_token
      cookie_str = res.headers['Set-Cookie']
      cookie = Rack::Utils.parse_query(cookie_str)

      expect(cookie['authenticity_token']).to eq(token)
    end

    it 'returns the same token when called multiple times in the same response' do
      expect(controller_base.form_authenticity_token).to eq(controller_base.form_authenticity_token)
    end
  end

  describe '#invoke_action' do
    before(:all) do
      class DummyController < ControllerBase
        protect_from_forgery

        def index
        end
      end

      class CatsController < ControllerBase
        def index
        end
      end
    end

    after(:all) do
      Object.send(:remove_const, 'DummyController')
      Object.send(:remove_const, 'CatsController')
    end

    it 'doesn\'t check authenticity token for a GET request' do
      dummy_controller = DummyController.new(req, res)

      expect(dummy_controller).not_to receive(:check_authenticity_token)
      dummy_controller.invoke_action(:index)
    end

    it 'doesn\'t check authenticity token unless ::protect_from_forgery is called' do
      nonsecure_controller = CatsController.new(req, res)

      expect(nonsecure_controller).not_to receive(:check_authenticity_token)
      nonsecure_controller.invoke_action(:index)
    end

    context 'a non-GET request' do
      let(:dummy_controller) { DummyController.new(req, res) }

      before(:each) do
        allow(req).to receive(:request_method).and_return('POST')
      end

      it 'calls #check_authenticity_token' do
        expect(dummy_controller).to receive(:check_authenticity_token)
        dummy_controller.invoke_action(:index)
      end


      it 'raises an error with an invalid token for any non-GET request' do
        expect { dummy_controller.invoke_action(:index) }.to raise_error('Invalid authenticity token')
      end

      it 'doesn\'t raise an error when a valid authenticity token is given' do

        # Simulate auth token being passed in both in params from form and cookies
        dummy_controller.params['authenticity_token'] = 'mocktoken'
        req.env['HTTP_COOKIE'] = 'authenticity_token=mocktoken'

        expect { dummy_controller.invoke_action(:index) }.not_to raise_error
      end
    end
  end
end
