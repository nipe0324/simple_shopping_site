require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "users attributes must not be empty" do
  	user = User.new
  	assert user.invalid?
  	assert user.errors[:name].any?
  	assert user.errors[:email].any?
  	assert user.errors[:address].any?
  end
end
