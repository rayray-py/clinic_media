function helpful_function(article_id) {
  $.ajax({
    url: "/api/helpful",
    type: "post",
    data: {
      article_id: article_id,
      dataType: "json"
    }
  }).done(function(data){
    var $helpful_button = $("#helpful_button")
    $helpful_button.removeAttr("id")
    $helpful_button.attr("id","helpful_button_disabled")
    $helpful_button.children("button").removeClass("is-outlined")
    $helpful_button.children("button").addClass("is-disabled is-primary")
  })
}
