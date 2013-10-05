require 'test_helper'

class CartTest < ActiveSupport::TestCase
  setup do
    @order_detail = order_details(:one) # 9.99
    @product = products(:one)
  	@cart = Cart.create
  end

#  test "total_price()" do
#  	@order_detail.product_id = @product.id
#  	@order_detail.cart_id = @cart.id
#  end
end