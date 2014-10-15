module RestaurantsHelper
  def image_url(restaurant)
    unless restaurant.image.url.blank?
      restaurant.image.url(:thumb).to_s
    else
      "http://placehold.it/250x200&text=" + restaurant.name
    end
  end

  def card_image_div(restaurant, user)
    html = ''
    html << '<div class="card image hover-effect '
    if user.restaurant == restaurant
      html << 'selected" '
    else
      html << '" '
    end
    html << 'style = "background-image: url(' + image_url(restaurant) +');" '
    html << 'onclick = "vote(' + restaurant.id.to_s + ', \'' + restaurant.name + '\');" '
    html << 'id = "restaurant_' + restaurant.id.to_s + '">'

    html.html_safe
  end
end
