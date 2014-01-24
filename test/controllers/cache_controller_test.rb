require 'test_helper'

class CacheControllerTest < ActionController::TestCase
  test "should get refresh" do
    get :refresh
    assert_response :success
  end

end
