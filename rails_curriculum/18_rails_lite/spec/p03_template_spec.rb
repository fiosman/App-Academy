require 'rack'
require 'controller_base'

describe ControllerBase do
  before(:all) do
    class CatsController < ControllerBase
      def index
        @cats = ['GIZMO']
      end
    end
  end
  after(:all) { Object.send(:remove_const, 'CatsController') }

  let(:req) { Rack::Request.new({'rack.input' => {}}) }
  let(:res) { Rack::MockResponse.new('200', {}, []) }
  let(:cats_controller) { CatsController.new(req, res) }

  describe '#render' do
    before(:each) do
      cats_controller.index
      cats_controller.render(:index)
    end

    it 'renders the html of the index view' do
      expect(cats_controller.res.body).to include('ALL THE CATS')
      expect(cats_controller.res.body).to include('<h1>')
      expect(cats_controller.res['Content-Type']).to eq('text/html')
    end

    it 'passes instance variable bindings to ERB#result' do
      expect(cats_controller.res.body).to include('GIZMO')
      expect(cats_controller.res['Content-Type']).to eq('text/html')
    end

    describe '#already_built_response?' do
      let(:cats_controller2) { CatsController.new(req, res) }

      it 'is false before rendering' do
        expect(cats_controller2.already_built_response?).to be_falsey
      end

      it 'is true after rendering content' do
        cats_controller2.render(:index)
        expect(cats_controller2.already_built_response?).to be_truthy
      end

      it 'raises an error when attempting to render twice' do
        cats_controller2.render(:index)
        expect do
          cats_controller2.render(:index)
        end.to raise_error
      end
    end
  end
end
