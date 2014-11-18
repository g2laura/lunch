json.array!(@orders) do |order|
  json.extract! order, :restaurant, :item, :user, :created_at, :updated_at
  json.url order_user_orders_url(order, format: :json)
end
