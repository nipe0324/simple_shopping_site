require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should show cart with correct cart_id" do
    get :show, id: @cart
    assert_response :success
  end

  test "should not show cart with incorrect cart_id" do
    get :show, id: "dummy"
    assert_response :redirect
    assert_redirected_to store_path
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete :destroy, { id: @cart.to_param }, { cart_id: @cart.id }
    end

    assert_redirected_to store_path
  end
end
