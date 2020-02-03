require 'rack'
require_relative '../lib/controller_base'

class MyController < ControllerBase
  def go
    if req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end
end
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)

