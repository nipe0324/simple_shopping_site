require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: {  }
    end

    assert_redirected_to cart_path(assigns(:cart))
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

  test "should get edit" do
    get :edit, id: @cart
    assert_response :success
  end

  test "should update cart" do
    patch :update, id: @cart, cart: {  }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete :destroy, { id: @cart.to_param }, { cart_id: @cart.id }
    end

    assert_redirected_to store_path
  end
end
