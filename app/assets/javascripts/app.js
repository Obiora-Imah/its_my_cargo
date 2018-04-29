"use strict";
angular.module("itsMyCargoApp", [
	"templates",
  "ui.router",
  "itsMyCargoApp.route",
  "itsMyCargoApp.controllers",
  "itsMyCargoApp.cargoService",
  "itsMyCargoApp.cargoMiddleWare"
]).config([
  "$locationProvider",
  "$provide",
  "$stateProvider",
  "$urlMatcherFactoryProvider",
  function($locationProvider, $provide, $stateProvider, $urlMatcherFactoryProvider) {
    if (window.history && window.history.pushState) {
      $locationProvider.html5Mode({enabled: true, requireBase: false});
    }

    $urlMatcherFactoryProvider.strictMode(false);

    var main = {
      name: "main",
      templateUrl: "layouts/layout.html"
    };

    $stateProvider.state(main);
  }
]);