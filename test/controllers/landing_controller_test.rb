require 'test_helper'

class LandingControllerTest < ActionController::TestCase
  test "should get shop" do
    get :shop
    assert_response :success
  end

end
