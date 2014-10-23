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
