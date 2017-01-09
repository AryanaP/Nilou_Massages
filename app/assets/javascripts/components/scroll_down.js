$(document).ready(function() {

  $("#scroll").click(function() {
    $('html,body').animate({
        scrollTop: $("#scroll-to").offset().top},
        'slow');
  });
});
