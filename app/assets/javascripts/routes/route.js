"use strict";
angular.module("itsMyCargoApp.route", ["ui.router"]).config([
  "$locationProvider",
  "$stateProvider",
  function($locationProvider, $stateProvider) {
    if (window.history && window.history.pushState) {
      $locationProvider.html5Mode({enabled: true, requireBase: false});
    }

    var dashboard = {
      name: "dashboard",
      url: "/",
      parent: "main",
      controller: "dashboardCtrl",
      templateUrl: "dashboard/views/index.html"
    };

    $stateProvider.state(dashboard);
  }
])