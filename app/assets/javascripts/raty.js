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

  $('.modal').on('shown.bs.modal', function(){
    var func = function(){
      if(null != $('#game-rating'))
      {
        $('#game-rating').raty({
          path: '/assets/',
          scoreName: 'comment[rating]',
          score: function() {
            return $(this).attr('data-score');
          } 
        })
      }
      else {setTimeout(func, 100);}
    }
    setTimeout(func,100);

    /*
    $('#game-rating').raty({
      path: '/assets/',
      scoreName: 'comment[rating]',
      score: function() {
        return $(this).attr('data-score');
      } 
    });
*/
  });

  
  $('.game-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
    return $(this).attr('data-score');
    }
  });

});





