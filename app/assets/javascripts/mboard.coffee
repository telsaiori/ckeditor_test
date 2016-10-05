# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->


  $(document).on 'click', '.display-comment', ->
    $(this).parent().siblings('.mboard-comment').addClass('show')
  
  $(document).on 'click', '.comment-cancel', ->
    $(this).parents('.mboard-comment').removeClass('show')
