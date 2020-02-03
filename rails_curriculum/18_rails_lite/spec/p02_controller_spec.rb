require 'rack'
require 'controller_base'

describe ControllerBase do
  before(:all) do
    class UsersController < ControllerBase
      def index
      end
    end
  end
  after(:all) { Object.send(:remove_const, 'UsersController') }

  let(:req) { Rack::Request.new({'rack.input' => {}}) }
  let(:res) { Rack::MockResponse.new('200',{},[]) }
  let(:users_controller) { UsersController.new(req, res) }

  describe '#render_content' do
    before(:each) do
      users_controller.render_content 'somebody', 'text/html'
    end

    it 'sets the response content type' do
      expect(res['Content-Type']).to eq('text/html')
    end

    it 'sets the response body' do
      expect(res.body).to eq('somebody')
    end

    describe '#already_built_response?' do
      let(:users_controller2) { UsersController.new(req, res) }

      it 'is false before rendering' do
        expect(users_controller2.already_built_response?).to be_falsey
      end

      it 'is true after rendering content' do
        users_controller2.render_content 'sombody', 'text/html'
        expect(users_controller2.already_built_response?).to be_truthy
      end

      it 'raises an error when attempting to render twice' do
        users_controller2.render_content 'sombody', 'text/html'
        expect do
          users_controller2.render_content 'sombody', 'text/html'
        end.to raise_error
      end
    end
  end

  describe '#redirect' do
    before(:each) do
      users_controller.redirect_to('http://www.google.com')
    end

    it 'sets the header' do
      expect(users_controller.res.header['location']).to eq('http://www.google.com')
    end

    it 'sets the status' do
      expect(users_controller.res.status).to eq(302)
    end

    describe '#already_built_response?' do
      let(:users_controller2) { UsersController.new(req, res) }

      it 'is false before rendering' do
        expect(users_controller2.already_built_response?).to be_falsey
      end

      it 'is true after rendering content' do
        users_controller2.redirect_to('http://google.com')
        expect(users_controller2.already_built_response?).to be_truthy
      end

      it 'raises an error when attempting to render twice' do
        users_controller2.redirect_to('http://google.com')
        expect do
          users_controller2.redirect_to('http://google.com')
        end.to raise_error
      end
    end
  end
end
