require 'erb'
require 'rack'

class ShowExceptions
  attr_reader :app 

  def initialize(app)
    @app = app
  end

  def call(env) 
    res = Rack::Response.new
    req = Rack::Request.new(env)
    begin
      app.call(env)
    rescue Exception => e
      res.write(render_exception(e))
    end   
    res.finish
  end

  private

  def render_exception(e) 
      template_path = File.join(
        File.dirname(__FILE__), 
        "templates", 
        "rescue.html.erb"
        ) 
      content = File.read(template_path)
      erb_body = ERB.new(content).result(binding)  
  end

end
