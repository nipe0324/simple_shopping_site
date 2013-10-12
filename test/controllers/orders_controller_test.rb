require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "requires item in cart" do
    get :new
    assert_redirected_to store_url
    assert_equal "カートは空です。", flash[:notice]
  end

  test "should get new" do
    cart = Cart.create
    OrderDetail.create(cart: cart, product: products(:one))

    get :new, {}, {cart_id: cart.id}
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { address: @order.address, pay_type: @order.pay_type, user_id: @order.user_id }
    end

    assert_redirected_to store_path
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { address: @order.address, pay_type: @order.pay_type, user_id: @order.user_id }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  test "should shipped order" do
    put :shipped, id: @order
    assert_equal 'shipped', Order.find(@order.id).status

    mail = ActionMailer::Base.deliveries.last
    assert_equal 'Simple_Shopping_Site <no-reply@example.com>', mail[:from].value
    assert_equal [@user.email], mail.to
    assert_equal I18n.t('order_notifier.shipped.subject'), mail.subject
  end
end
