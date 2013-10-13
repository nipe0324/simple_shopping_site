require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  fixtures :categories

  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:name].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
    assert product.errors[:category_id].any?
  end

  test "product price must be positive" do
  	product = Product.new(name: products(:one).name, description: 'Description',
  		image_url: 'zzz.jpg', category_id: categories(:one).id)

  	product.price = -1
  	assert product.invalid?

  	product.price = -0.1
  	assert product.invalid?

  	product.price = 0
  	assert product.invalid?

  	product.price = 0.1
  	assert product.invalid?

  	product.price = 1
  	assert product.valid?
  end

  test "ensure_not_referenced_by_any_line_item" do
    product = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: 1)
    assert product.send(:ensure_not_referenced_by_any_line_item)

    order_detail = OrderDetail.create(product_id: product.id)
    refute false, product.send(:ensure_not_referenced_by_any_line_item)
  end
end
