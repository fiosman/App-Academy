require 'rack' 
require 'json' 

app = Proc.new do |env| 
  req = Rack::Request.new(env) 
  res = Rack::Response.new 

  if req.path == "/kobe" 
    res.status = 302 
    res.location = 'https://pbs.twimg.com/media/D3VZo_aUEAA8rQ1.jpg'
  else 
    res.write('Nothing to show')
  end

  res.finish
end

Rack::Server.start({ 
  app: app, 
  Port: 3000
})