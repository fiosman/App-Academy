require 'rack'

class Static
  def initialize(app)
    @app = app 
  end

  def call(env)
    req = Rack::Request.new(env) 
    res = Rack::Response.new 

    path = '/public/hello.txt'
    if req.path == path    
      res.write(File.read('./public/hello.txt'))
      res.finish
    end
  end
  
end
