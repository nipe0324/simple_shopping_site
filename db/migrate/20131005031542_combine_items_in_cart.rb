class CombineItemsInCart < ActiveRecord::Migration
  # カート内の各商品の数をカウントし、同じ商品は1レコードにまとめあげる
  def up
  	Cart.all.each do |cart|
  		sums = cart.order_details.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				cart.order_details.where(product_id: product_id).deteila_all
  				cart.order_details.create(product_id: product_id, quantity: quantity)
  			end
  		end
  	end
  end

  # 1レコードにまとめた商品を、quantity分だけレコードを作成する
  def down
  	OrderDetail.where("quantity > 1").each do |order_detail|
  		order_detail.quantity.times do
  			OrderDetail.create cart_id: order_detail.cart_id,
  			  product_id: line_item.product_id, quantity: 1
  			end

  			order_detail.destroy
  		end
  end
end
