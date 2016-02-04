$(document).ready (function () {
  $(document).scroll(function() {
    if ($(this).scrollTop() > 20) {
      $('.header').animate({ height: '11rem', overflow: 'hidden' }, 200);
    } else {
      $('.header').animate({ height: '21rem' }, 200);
    }
  });

  $("#tweet-form-field").on("click", function () {
    $("#tweets-container-tweet-form").removeClass("tweet-form-field");
  });

  // $(":not(#tweet-form-field)").on("click", function() {
  //   $("#tweets-container-tweet-form").addClass("tweet-form-field");
  // });
});