window.vote = (restaurant) ->
  $.ajax
    type: "GET"
    url: "restaurants/" + restaurant + "/vote"
    success: (data) ->
      $('.card').removeClass('selected')
      $('#restaurant_' + restaurant).addClass('selected')
      $('.toast').attr('text', 'Voted for ' + data.name)
      document.querySelector('.toast').show()

      $.ajax
        type: "GET"
        url: "restaurants.json"
        success: (data) ->
          $.each(data, (index, restaurant) ->
            $('#vote_' + restaurant.id).text("Votes: " + restaurant.users.length)
          )
          return;

      return;

  return;

window.showUsers = (restaurant) ->

  $.ajax
    type: "GET"
    url: "restaurants/" + restaurant + ".json"
    success: (data) ->
      users = $('#users_' + restaurant)
      html = "<div>"
      $.each(data.users, (index, user) ->
        html += "<div class=\"avatar\"><img style=\"max-width:50px;max-height:50px;\" src=\"" + user.avatar.url + "\" ></div>" if user.avatar.url
        html += "<div class=\"avatar\"><img src=\"http://placehold.it/50x50&text=" + user.name + "\" ></div>" if not user.avatar.url
      )
      html += "</div>"
      users.html(html)
      $('#restaurant_' + restaurant).toggleClass("hover-effect")
      users.toggle()
      return;

  return;

update_items = (data, restaurant) ->
  html = ""
  $.each(data.orders, (index, elem) ->
    html += "<li id=\"item_" + elem.item.id + "\">" +
              elem.item.name + " $" + elem.item.price +
              "<a href=\"#\" onclick=\"removeOrder(" + restaurant + ", " + elem.item.id + ")\">x</a>" +
            "</li>"
  )
  html += "<li>Total: $" + data.total + "</li>"
  return html;

window.order = (restaurant, item) ->
  $.ajax
    type: "POST"
    url: "/order/" + restaurant + "/" + item
    success: (data) ->
      html = update_items(data, restaurant)
      $("#lunch_items ul").html(html)
      if data.order != null
        $('.toast').attr('text', 'Added ' + data.order.item.name)
      else
        $('.toast').attr('text', data.message)
      document.querySelector('.toast').show()
      return;
  return;

window.removeOrder = (restaurant, item) ->
  $.ajax
    type: "DELETE"
    url: "/order/" + restaurant + "/" + item
    success: (data) ->
      html = update_items(data, restaurant)
      $("#lunch_items ul").html(html)
      $('.toast').attr('text', 'Order succesfully removed')
      document.querySelector('.toast').show()
      return;
  return;
