# require 'rack/show_exceptions'
require 'rack/lint'
require 'rack/mock'
require 'show_exceptions'

describe ShowExceptions do
  let(:show_exceptions) { ShowExceptions.new(app) }
  let(:good_dummy_app) { Proc.new {} }
  let(:bad_dummy_app) { Proc.new { raise RuntimeError }}

  describe '#initialize' do
    it 'initializes with an app' do
      mock_exception = ShowExceptions.new(good_dummy_app)
      expect(mock_exception.app).to be(good_dummy_app)
    end
  end

  describe '#call' do

    let(:env) { {} }

    it 'calls #call on the app' do
      mock_exception = ShowExceptions.new(good_dummy_app)
      expect(good_dummy_app).to receive(:call).with(env)
      mock_exception.call(env)
    end

    context 'when an app throws an error' do
      let(:mock_exception) { ShowExceptions.new(bad_dummy_app) }

      it 'catches exceptions' do
        expect { mock_exception.call(env) }.not_to raise_error
      end

      it 'sets the status code to 500' do
        response = mock_exception.call(env)
        expect(response[0]).to eq '500'
      end

      it 'sets the content type to text/html' do
        response = mock_exception.call(env)
        expect(response[1]).to eq({'Content-type' => 'text/html'})
      end

      it 'the body of the response includes the error type' do
        response = mock_exception.call(env)
        expect(response[2]).to include 'RuntimeError'
      end
    end
  end
end
