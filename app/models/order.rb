class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "現金", "クレジットカード", "注文書" ]

	belongs_to	:user
	has_many		:order_details, dependent: :destroy

	validates :address, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_order_details_from_cart(cart)
  	cart.order_details.each do |item|
  		item.cart_id = nil
  		order_details << item
  	end
  end
end
