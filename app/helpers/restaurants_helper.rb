module RestaurantsHelper
  def image_url(restaurant)
    unless restaurant.image.url.blank?
      restaurant.image.url(:thumb).to_s
    else
      "http://placehold.it/250x200&text=" + restaurant.name
    end
  end
end
