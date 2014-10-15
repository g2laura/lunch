window.vote = (restaurant, name) ->
  $.ajax
    type: "GET"
    url: "restaurants/" + restaurant + "/vote"
    success: (data) ->
      $('.card').removeClass('selected')
      $('#restaurant_' + restaurant).addClass('selected')
      $('.toast').attr('text', 'Voted for ' + name)
      document.querySelector('.toast').show()
      return;

  return;