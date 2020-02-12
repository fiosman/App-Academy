require 'json'

class Flash
  def initialize(req)
    req_cookie = req.cookies['_rails_lite_app_flash']
  end 

  def [](key) 
  end 

  def []=(key, val) 
  end 

  def store_flash(res) 
  end

 end
