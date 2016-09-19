$(document).ready(function(){
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'game[rating]',
    score: function() {
        return $(this).attr('data-score');
    }

  });

  $('.star-rating').raty({
      path: '/assets/',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
    }
  });

});
