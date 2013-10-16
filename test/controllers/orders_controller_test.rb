require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @user = users(:user)
    @admin = users(:admin)
  end


  test "should get index" do
    sign_in @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "requires item in cart" do
    sign_in @user
    get :new
    assert_redirected_to store_url
    assert_equal "カートは空です。", flash[:notice]
  end

  test "should get new" do
    sign_in @user
    cart = Cart.create
    OrderDetail.create(cart: cart, product: products(:one))

    get :new, {}, {cart_id: cart.id}
    assert_response :success
  end

  test "should create order success" do
    sign_in @user
    assert_difference('Order.count') do
      post :create, order: { address: @order.address, pay_type: @order.pay_type, user_id: @order.user_id }
    end

    assert_redirected_to store_path
  end

  test "should create order failure" do
    sign_in @user
    assert_no_difference('Order.count') do
      post :create, order: { address: '', pay_type: '', user_id: @order.user_id }
    end

    assert_response :success
    assert_template 'new'
  end

  test "should show order" do
    sign_in @admin
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get :edit, id: @order
    assert_response :success
  end

  test "should update order success" do
    sign_in @admin
    patch :update, id: @order, order: { address: @order.address, pay_type: @order.pay_type, user_id: @order.user_id }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should update order failure" do
    sign_in @admin
    patch :update, id: @order, order: { address: '', pay_type: '', user_id: @order.user_id }
    assert_response :success
    assert_template 'edit'
  end

  test "should destroy order" do
    sign_in @admin
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  test "should ship order" do
    sign_in @admin
    put :shipped, id: @order
    assert_equal 'shipped', Order.find(@order.id).status

    mail = ActionMailer::Base.deliveries.last
    assert_equal 'Simple_Shopping_Site <no-reply@example.com>', mail[:from].value
    assert_equal [@user.email], mail.to
    assert_equal I18n.t('order_notifier.shipped.subject'), mail.subject
  end
end
