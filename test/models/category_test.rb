require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category attributes must not be empty" do
  	category = Category.new
  	assert category.invalid?
  	assert category.errors[:name].any?
  end
end
