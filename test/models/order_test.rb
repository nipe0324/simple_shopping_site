require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "order attributes must not be empty" do
		order = Order.new
	  assert order.invalid?
  	assert order.errors[:address].any?
  	assert order.errors[:pay_type].any?
  end
end