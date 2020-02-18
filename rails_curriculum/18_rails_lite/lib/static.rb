require 'rack'

class Static
  def initialize(app)
    @app = app 
  end

  def call(env)
    req = Rack::Request.new(env) 
    res = Rack::Response.new 

    file_path = (File.join(File.dirname(__FILE__), '..', "#{req.path}")) 
    file_extension = get_file_extension(req.path).captures.first

    begin 
      file_content = File.read(file_path)
    rescue SystemCallError => e         
      res.status = 404 
    else 
      res['Content-Type'] = Rack::Mime.mime_type(file_extension)
      res.write(file_content)
    end
    res.finish
  end


  private 

  def get_file_extension(route_pattern) 
    route_pattern.match(/(\..*)/)
  end
end
