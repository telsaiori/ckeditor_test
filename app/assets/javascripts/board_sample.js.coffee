window.App = angular.module('BoardSample', ['ngResource'])
 
App.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    document.getElementsByName("csrf-token")[0].content