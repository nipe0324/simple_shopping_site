require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "order attributes must not be empty" do
		order = Order.new
	  assert order.invalid?
  	assert order.errors[:address].any?
  end

  test "order attributes must not be inclusion" do
  	order = Order.new(address: 'address')

  	order.pay_type = Order::PAYMENT_TYPES[0]
  	order.valid?

  	order.pay_type = 'not payment type'
  	order.invalid?
  end

  test "add_order_details_from_cart" do
  	cart = Cart.create
  	order_detail = OrderDetail.create(cart_id: cart.id)
  	order = Order.create(address: 'address', pay_type: Order::PAYMENT_TYPES[0])

  	assert_difference('order.order_details.size', 1) do
      order.add_order_details_from_cart(cart)
    end
  end

  test "total_price" do
  	order = Order.create(address: 'address', pay_type: Order::PAYMENT_TYPES[0])
  	
  	# order_detail.total_price = 10
  	product1 = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: 1)
  	order.order_details << OrderDetail.create(product_id: product1.id, quantity: 1)
  	assert_equal 10, order.total_price.to_i

  	# order_detail2.total_price = 10
  	product2 = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: 1)
  	order.order_details << OrderDetail.create(product_id: product2.id, quantity: 1)
  	assert_equal 20, order.total_price.to_i
  end
end
