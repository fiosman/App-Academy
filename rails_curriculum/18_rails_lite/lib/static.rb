require 'rack'

class Static
  def initialize(app)
    @app = app 
  end

  def call(env)
    req = Rack::Request.new(env) 
    res = Rack::Response.new 

    file_path = (File.join(File.dirname(__FILE__), '..', "#{req.path}")) 

    begin 
      file_content = File.read(file_path)
    rescue SystemCallError => e         
      res.status = 404 
    else 
      res.write(file_content) 
    end
    res.finish
  end

end
