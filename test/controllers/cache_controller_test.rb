require 'test_helper'

class CacheControllerTest < ActionController::TestCase
  test "should get purge" do
    get :purge
    assert_response :success
  end

end
