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

    // $provide.decorator("$locale", ["$delegate", function($delegate) {
    //   if ($delegate.id === "en-us") {
    //     $delegate.NUMBER_FORMATS.PATTERNS[1].negPre = "-\u00A4";
    //     $delegate.NUMBER_FORMATS.PATTERNS[1].negSuf = "";
    //   }
    //   return $delegate;
    // }]);

    var main = {
      name: "main",
      templateUrl: "layouts/layout.html"
    };

    $stateProvider.state(main);
  }
]);