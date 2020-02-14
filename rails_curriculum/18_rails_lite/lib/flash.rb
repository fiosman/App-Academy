require 'json'

class Flash
  def initialize(req)
    req_cookie = req.cookies['_rails_lite_app_flash']
    @flash_store= {}
  end 

  def [](key) 
    @flash_store[key]
  end 

  def []=(key, val) 
    @flash_store[key] = val
  end 

  def store_flash(res) 
  end

 end
