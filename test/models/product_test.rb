require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes moust not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:name].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  	assert product.errors[:status].any?
  end

  test "product price must be positive" do
  	product = Product.new(name: products(:one).name, description: 'Description',
  		image_url: 'zzz.jpg', status: 'finished')

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
