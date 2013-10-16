require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  def setup
    @user = users(:user)
    @order = orders(:one)
    @order.user_id = @user.id
  end

  test "received" do
    mail = OrderNotifier.received(@order)
    assert_equal [@order.user.email], mail.to
    assert_equal ["no-reply@example.com"], mail.from
    assert_match "user", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(@order)
    assert_equal [@order.user.email], mail.to
    assert_equal ["no-reply@example.com"], mail.from
    assert_match "user", mail.body.encoded
  end

end
