json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :slogan, :phone_number, :email, :address, :twitter, :instagram, :facebook, :website, :delivery
  json.url restaurant_url(restaurant, format: :json)
end
