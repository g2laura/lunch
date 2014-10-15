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
