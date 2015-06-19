$(document).ready(function() {

  var audio = new Audio('/media/rashad.wav');

  $(document).on('click', '#rashad', function (e) {
    e.preventDefault();
    audio.play();
  });

});