require 'test_helper'

class OrderDetailTest < ActiveSupport::TestCase
	test "total_price" do
  	product = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: 1)
  	order_detail = OrderDetail.new(product_id: product.id)

  	order_detail.quantity = 1
  	assert_equal 10, order_detail.total_price

		order_detail.quantity = 2
  	assert_equal 20, order_detail.total_price
	end
end
