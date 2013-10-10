require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:name].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  end

  test "product price must be positive" do
  	product = Product.new(name: products(:one).name, description: 'Description',
  		image_url: 'zzz.jpg')

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
end
