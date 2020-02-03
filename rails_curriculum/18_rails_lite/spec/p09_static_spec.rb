
require 'static'
require 'rack'

class DummyApp
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ['Hello World']]
  end
end

describe Static do
  let(:static) { Static.new(DummyApp.new) }
  let(:request) { Rack::MockRequest.new(static) }

  it 'serves files' do
    res = request.get('/public/hello.txt')
    expect(res.body).to match(/Hello there friend/)
  end

  it '404s if url root is known but it can\'t find the file' do
    res = request.get('/public/nicholas.jpg')
    expect(res.status).to be(404)
  end
end
