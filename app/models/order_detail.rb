class OrderDetail < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	belongs_to :order

  # 注文詳細の合計金額を計算する
	def total_price
		product.price * quantity
	end
end
