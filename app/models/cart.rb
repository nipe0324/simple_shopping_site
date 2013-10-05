class Cart < ActiveRecord::Base
	has_many :order_details, dependent: :destroy

	def add_product(product_id)
		current_item = order_details.find_by_product_id(product_id)
		if current_item
			current_item.quantity = current_item.quantity + 1
		else
			current_item = order_details.build(product_id: product_id)
		end
		return current_item
	end

  # カート内のすべてのアイテムの合計金額を計算する
  def total_price
  	order_details.to_a.sum { |order_detail| order_detail.total_price }
  end
end
