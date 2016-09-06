$(document).ready(function(){
  $('.reply').click(function(){
      $(this).siblings('form').show();
      return false;
  });

  $('.more_replies').click(function(){
    $(this).siblings('.reply-list').show();
    return false
  });
});

