require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get product_purchase" do
    get :product_purchase
    assert_response :success
  end

  test "should get payment" do
    get :payment
    assert_response :success
  end

end
