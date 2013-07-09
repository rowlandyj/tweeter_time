$(document).ready(function() {
  $('.container').on('submit','form',function(e){
    e.preventDefault();
    $('#tweets').html("<img src='hypnotoad.gif'>");
    $.post('/', $(this).serialize()).done(function(response){
      $('#tweets').html(response);
    });
  });

  $('#new_tweet-form').on('submit', function(e){
    e.preventDefault();
    $.post('/new_tweet', $(this).serialize()).done(function(response){
      $('#new_tweets').html(response)
    });
  });
});
