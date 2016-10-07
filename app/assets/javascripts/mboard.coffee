# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->


  $(document).on 'click', '.display-comment', ->
    $(this).parent().siblings('.mboard-comment').addClass('show')
  
  $(document).on 'click', '.comment-cancel', ->
    $(this).parents('.mboard-comment').removeClass('show')

  $('.panel-body').on 'click', '.edit-comment-form, .cancel-mcomment', (event) ->
    toggleEditor $(this).closest('.panel-body')

toggleEditor = ($container) ->
  $container.find('.viewer, .editor').toggle()
  $bodyField = $container.find('.editor .body')
  if $bodyField.is(':visible')
    $bodyField
      .val($container.find('.viewer .body').text())
      .select()
