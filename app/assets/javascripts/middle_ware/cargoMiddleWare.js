"use strict";

angular.module("itsMyCargoApp.cargoMiddleWare", []).factory("CargoMiddleWare", [
  "CargoService",
  function(CargoService) {
    return {
      getShipmentSummary: function() {
        return CargoService.ajaxRequest({
          url: "/api/v1/dashboard/shipment_data.json"
        });
      },

      getRouteSummary: function() {
        return CargoService.ajaxRequest({
          url: "/api/v1/dashboard/route_summary.json"
        });
      },

      getFreightSummary: function() {
        return CargoService.ajaxRequest({
          url: "/api/v1/dashboard/freight_data.json"
        });
      },

      getBookingSummary: function() {
        return CargoService.ajaxRequest({
          url: "/api/v1/dashboard/booking_data.json"
        });
      }
    };
  }
]);
