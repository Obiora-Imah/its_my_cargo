"use strict";

angular.module("itsMyCargoApp.cargoService", []).factory("CargoService", [
  "$http",
  function($http) {
    return {
      ajaxRequest: function(data) {
        return  $http({
          method: "GET",
          url: data.url
        });
      }
    };
  }
]);
