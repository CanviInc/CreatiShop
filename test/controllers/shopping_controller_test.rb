require 'test_helper'

class ShoppingControllerTest < ActionController::TestCase
  test "should get product_display" do
    get :product_display
    assert_response :success
  end

end
