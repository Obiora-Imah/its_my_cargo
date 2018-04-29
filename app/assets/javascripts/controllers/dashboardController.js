angular.module("itsMyCargoApp.controllers").controller("dashboardCtrl", [
  "$location",
  "$scope",
  "$state",
  "CargoMiddleWare",
  function($location, $scope, $state, CargoMiddleWare) {
  	$scope.init = function() {
      cargoRouteSummary()
      cargoShipmentSummary();
      cargoBookingSummary();
      cargoFreightSummary();
      
  	};

    var cargoShipmentSummary = function() {
      CargoMiddleWare.getShipmentSummary()
        .success(function(response) {
          $scope.pielabels = ["accepted", "completed", "declined", "open"];
          $scope.piedata = [
            response.accepted,
            response.completed,
            response.declined,
            response.open];
          $scope.totalShipment = response.accepted + response.completed + response.declined + response.open
        })
        .error(function(err) {
          // handle error later
        })
    }

    var cargoRouteSummary = function() {
      CargoMiddleWare.getRouteSummary()
        .success(function(response) {
          $scope.routepielabels = [
            "Most Popular Destination: " + response.popular_destination[0],
            "Most Popular Origin: " + response.popular_origin[0],
            "Most Popular Route: " + response.popular_route[0]
          ];
          $scope.routepiedata = [
            response.popular_destination[1],
            response.popular_origin[1],
            response.popular_route[1]];
        })
        .error(function(err) {
          // handle error later
        })
    }

    var cargoBookingSummary = function() {
      CargoMiddleWare.getBookingSummary()
        .success(function(response) {
          $scope.barlabels = ["closed booking", "open booking", "sold booking", ""];
          $scope.bardata = [
            response.closed,
            response.open,
            response.sold,
            0];
          $scope.totalBooking = response.closed + response.open + response.sold
        })
        .error(function(err) {
          // handle error later
        })
    }
    var cargoFreightSummary = function() {
      CargoMiddleWare.getFreightSummary()
        .success(function(response) {
          $scope.capacity = serviceSold(response.capacity_sold)
          $scope.service = serviceSold(response.service_amount)
          $scope.capacityHeaders = headers($scope.capacity)
          $scope.serviceHeaders = headers($scope.service)
          $scope.freightCapacityBarData = salesBarData($scope.capacity, response.capacity_sold);
          $scope.freightServiceBarData = salesBarData($scope.service, response.service_amount);

          $scope.capacitybarlabels2 = [];
          $scope.capacitybardata2 = [];
          $scope.freightCapacityBarData.forEach(function(barChart) {
            $scope.capacitybarlabels2.push(barChart[0]);
            $scope.capacitybardata2 .push(barChart[1]);
          })
          $scope.capacitybarseries2 = [];
          $scope.capacityHeaders.column.forEach(function(column) {
            $scope.capacitybarseries2.push(column)
          })

          $scope.serviceBarlabels2 = [];
          $scope.serviceBardata2 = [];
          $scope.freightServiceBarData.forEach(function(barChart) {
            $scope.serviceBarlabels2.push(barChart[0]);
            $scope.serviceBardata2 .push(barChart[1]);
          })
          $scope.serviceBarseries2 = [];
          $scope.serviceHeaders.column.forEach(function(column) {
            $scope.serviceBarseries2.push(column)
          })
        })
        .error(function(err) {
          // handle error later
        })
    }
    
    var capacitySold = function(obj) {
      var jsonData = [];
      var keys = Object.keys(obj)
      keys.forEach(function(key) {
        var tblData = JSON.parse(key)
        tblData.push(obj[key])
        jsonData.push(tblData)
      })
      return jsonData
    }

    var serviceSold = function(obj) {
      var jsonData = [];
      var keys = Object.keys(obj)
      keys.forEach(function(key) {
        var tblData = JSON.parse(key)
        tblData.push(parseFloat(obj[key]))
        jsonData.push(tblData)
      })

      return jsonData
    }

    var headers = function(keys) {
      var _headers = {
        row: [],
        column: []
      }
      var track = []
      keys.forEach(function(key) {
        if(!track.includes(key[0])){
          track.push(key[0])
          var data = []
          var sum = getSum(keys, key[0]);
          data.push(key[0]);
          data.push(sum);
          _headers.row.push(data);
        }
        if(!_headers.column.includes(key[1])){
          _headers.column.push(key[1]);
        }
      })
      track = null
      return _headers
    }
    var salesBarData = function(freights, raw) {
      var almightArr = [];
      var _headers = headers(freights);
      _headers.row.forEach(function(item) {
        var chartData = [];
        var capacity = item[0];
        chartData.push(capacity);
        var freightTypesData = []
        var sum = 0;
        _headers.column.forEach(function(col) {
            var originalKey = "[\"" + capacity + "\", \"" + col + "\"]"
            console.log(originalKey)
            if(!isNaN(raw[originalKey]))
              freightTypesData.push(raw[originalKey]);
            else
              freightTypesData.push(0);
        })
        chartData.push(freightTypesData);  
        almightArr.push(chartData)      
      })
      return almightArr;
    }

    var getSum = function(arr, element) {
     var map =  arr.map(function(item) {
        if(item[0] == element)
          return item[2]
        else return 0 
      }).reduce(add, 0)
     return map
    }
    var add = function(a, b) {
      return a + b;
    }

  	$scope.init();
  }
])