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
          $.each(data, (index, item) ->
            $('#vote_' + item.id).text("Votes: " + item.users.length)
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
      html = "<ul>"
      $.each(data.users, (index, item) ->
        html += ("<li>" + item.email + "</li>")
      )
      html += "</ul>"
      users.html(html)
      users.toggle()
      return;

  return;
