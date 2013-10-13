require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category attributes must not be empty" do
  	category = Category.new
  	assert category.invalid?
  	assert category.errors[:name].any?
  end

  test "ensure_not_referenced_by_any_products" do
  	category = Category.create(name: 'category')
  	assert category.send(:ensure_not_referenced_by_any_products)

  	product = Product.create(name: 'product', description: 'desc', image_url: 'zzz.jpg', price: 10, category_id: category.id)
  	refute false, category.send(:ensure_not_referenced_by_any_products)
  end
end
