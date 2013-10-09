json.array!(@orders) do |order|
  json.extract! order, :user_id, :address, :pay_type
  json.url order_url(order, format: :json)
end
