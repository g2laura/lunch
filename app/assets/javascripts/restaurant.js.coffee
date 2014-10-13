window.vote = (restaurant, name) ->
  $.ajax
    type: "GET"
    url: "restaurants/" + restaurant + "/vote"
    success: (data) ->
      $('.toast').attr("text", "Voted for " + name)
      document.querySelector('.toast').show()
      return;

  return;