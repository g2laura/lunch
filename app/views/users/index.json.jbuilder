json.array!(@users) do |user|
  json.extract! user, :id, :avatar, :name, :email, :password, :admin
  json.url user_url(user, format: :json)
end
