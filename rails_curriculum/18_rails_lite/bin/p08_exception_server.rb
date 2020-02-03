require 'rack'
require_relative '../lib/controller_base'
require_relative '../lib/router'
require_relative '../lib/show_exceptions'

class StatusesController < ControllerBase
  def index
    statuses = $statuses.select do |s|
      s[:cat_id] == Integer(params['cat_id'])
    end

    render_content(statuses.to_s, "text/text")
  end
end

class Cats2Controller < ControllerBase
  def index
    render_content($cats.to_s, "text/text")
  end
end

class MyController < ControllerBase
  def critical
    raise "Critical error. Abort, abort, abort"
  end

  def dreaded_nil
    nil + 1
  end

  def okay
    render_content("Everything worked :)", "text/html")
  end
end

router = Router.new
router.draw do
  get Regexp.new("^/raise$"), MyController, :critical
  get Regexp.new("^/nil$"), MyController, :dreaded_nil
  get Regexp.new("^/okay$"), MyController, :okay
  get Regexp.new("^/$"), MyController, :okay
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

app = Rack::Builder.new do
  use ShowExceptions
  run app
end.to_app

Rack::Server.start(
 app: app,
 Port: 3000
)
