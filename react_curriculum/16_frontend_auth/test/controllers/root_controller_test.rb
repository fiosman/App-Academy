require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_root_url
    assert_response :success
  end

end
