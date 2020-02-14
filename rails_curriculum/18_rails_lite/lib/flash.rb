require 'json'

class Flash
  attr_reader :now

  def initialize(req)
    req_cookie = req.cookies['_rails_lite_app_flash']
    @flash_store = {}
    @now = {} 

    if req_cookie 
      @now = JSON.parse(req_cookie)
    end
  end 

  def [](key) 
    flashes = @flash_store.merge(@now) 
    flashes[key.to_s]
  end 

  def []=(key, val) 
    @flash_store[key] = val || @now[key] = val
  end 

  def store_flash(res) 
    res.set_cookie(
      '_rails_lite_app_flash', 
        value: @flash_store.to_json, 
        path: "/"
    )
  end

 end
