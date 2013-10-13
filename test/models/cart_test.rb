require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add_product" do
  	cart = Cart.create
  	product = Product.create(name: 'MyString', description: 'Description', price: 10, image_url: 'zzz.jpg', category_id: 1)

  	assert_equal 1, cart.add_product(product.id).quantity

  	order_detail = cart.add_product(product.id)
  	cart.order_details << order_detail
  	assert_equal 2, cart.add_product(order_detail.product_id).quantity
  end

   test "total_price" do
  	cart = Cart.create
  	
  	# order_detail.total_price = 10
  	product1 = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: 1)
  	cart.order_details << OrderDetail.create(product_id: product1.id, quantity: 1)
  	assert_equal 10, cart.total_price.to_i

  	# order_detail2.total_price = 10
  	product2 = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: 1)
  	cart.order_details << OrderDetail.create(product_id: product2.id, quantity: 1)
  	assert_equal 20, cart.total_price.to_i
  end
end