App.controller 'GuestbooksCtrl', ($scope, Guestbook) ->
  $scope.guestbooks = Guestbook.query()