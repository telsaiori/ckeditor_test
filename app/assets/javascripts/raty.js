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

  $('.modal').on('shown.bs.modal', function(e){
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
    setTimeout(func,500);

  });

  // $('body').on('hidden.bs.modal', '.modal', function () {
  //   $(this).removeData('bs.modal');
  // });

    /*
    $('#game-rating').raty({
      path: '/assets/',
      scoreName: 'comment[rating]',
      score: function() {
        return $(this).attr('data-score');
      } 
    });
*/
  

  
  $('.game-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
    return $(this).attr('data-score');
    }
  });

});





