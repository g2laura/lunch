window.vote = (restaurant) ->
  $.ajax
    type: "GET"
    url: "restaurants/" + restaurant + "/vote"
    success: (data) ->
      alert("Voted for: " + data.name)
      return;

  return;