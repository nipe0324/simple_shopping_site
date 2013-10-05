json.array!(@order_details) do |order_detail|
  json.extract! order_detail, :product_id, :cart_id
  json.url order_detail_url(order_detail, format: :json)
end
