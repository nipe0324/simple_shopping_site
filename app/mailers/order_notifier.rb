class OrderNotifier < ActionMailer::Base
  default from: 'Simple_Shopping_Site <no-reply@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: @order.user.email, subject: t('.subject')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: @order.user.email, subject: t('.subject')
  end
end
