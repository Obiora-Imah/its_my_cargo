"use strict";

angular.module("itsMyCargoApp.cargoService", []).factory("CargoService", [
  "$http",
  function($http) {
    return {
      ajaxRequest: function(data) {
        console.log(data)
        return  $http({
          method: "GET",
          url: data.url
        });
      }
    };
  }
]);
