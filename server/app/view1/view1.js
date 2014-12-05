'use strict';

angular.module('myApp.view1', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/view1', {
    templateUrl: 'view1/view1.html',
    controller: 'View1Ctrl'
  });
}])

.controller('View1Ctrl', ['$scope','$http', '$interval', function($scope, $http, $interval) {
	$scope.map = { center: { latitude: 42.7500, longitude: 25.5000 }, zoom: 7, clusterOptions: {title: 'Cluster of Points', ignoreHidden: true, minimumClusterSize: 35}};
    /*$scope.$watch('map.zoom', function() {
        console.log($scope.map.zoom)
       if ($scope.map.zoom>18) $scope.map.clusterOptions.minimumClusterSize=100;
       else $scope.map.clusterOptions.minimumClusterSize=10;
       console.log($scope.map.clusterOptions.minimumClusterSize)
       //$scope.$apply();
   });*/

    $scope.radioMarkers = 'Yes';
    $scope.radioLines = 'Yes';
    $scope.radioRefresh = 'Off';
    $scope.radioSort = 'timestamp';
    $scope.radioOrder = 'desc';
    $scope.recordSize = 250;
    $scope.clusterSize = $scope.map.clusterOptions.minimumClusterSize;
    $scope.events = [];



    $scope.$watch('map.clusterOptions.minimumClusterSize', function() {
       $scope.clusterSize = $scope.map.clusterOptions.minimumClusterSize;
       //$scope.$apply();
    });

    $scope.$watch('radioRefresh', function() {
        if ($scope.radioRefresh=='On') {
                $scope.refresh = $interval(function(){
                    $scope.newQuery(); 
                }, 30000); 
        }
        else {
            $interval.cancel($scope.refresh);
        }
    });
    

    $scope.clustIncr = function(bool) {
        $scope.map.clusterOptions.minimumClusterSize = parseInt($scope.map.clusterOptions.minimumClusterSize);
        if (bool==true) $scope.map.clusterOptions.minimumClusterSize += 25;
        else {
            if ($scope.map.clusterOptions.minimumClusterSize > 25) {
                $scope.map.clusterOptions.minimumClusterSize -= 25;
            }
        }

    };

    $scope.recordIncr = function(bool) {
        $scope.recordSize = parseInt($scope.recordSize);
        if (bool==true) $scope.recordSize += 50;
        else {
            if ($scope.recordSize > 50) {
                $scope.recordSize -= 50;
            }
        }

    };

    $scope.IsNumeric = function(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    }

    $scope.newQuery = function() {
        $scope.polylines = [];
        //console.log($scope.polylines[0].path);
        $scope.randomMarkers = [];
        $scope.events = [];
        $http({method: 'GET', url: 'http://theodoregoranov.com/api/data?limit='+ $scope.recordSize +'&by='+$scope.radioSort +'&order='+$scope.radioOrder}).
        success(function(data, status, headers, config) {
            $scope.data = data;
            //console.log("success");
            //console.log($scope.data);

            $scope.polylines = [{"id": 1, "path":[], "stroke":{"color": '#FF0000',"weight": 3}, "static":true}]
            //console.log($scope.polylines[0].path);
            $scope.randomMarkers = [];
            for (var key in $scope.data) {
              if ($scope.data.hasOwnProperty(key)) {
                //key.onClick = function() {
                //    console.log("Clicked!");
                //    $key.show = !$key.show;
                //};
                var km = $scope.data[key]['speed'] * 3.6;  //remove in the future!!!
                var iconType = "markers/0.png";
                if (km<1) iconType = "markers/0.png";
                else if (km>1&&km<10) iconType = "markers/5.png";
                else if (km<20) iconType = "markers/10.png";
                else if (km<30) iconType = "markers/20.png";
                else if (km<40) iconType = "markers/30.png";
                else if (km<50) iconType = "markers/40.png";
                else if (km<60) iconType = "markers/50.png";
                else if (km<70) iconType = "markers/60.png";
                else if (km<80) iconType = "markers/70.png";
                else if (km<90) iconType = "markers/80.png";
                else if (km<100) iconType = "markers/90.png";
                else if (km<110) iconType = "markers/100.png";
                else if (km<120) iconType = "markers/110.png";
                else if (km<130) iconType = "markers/120.png";
                else if (km<140) iconType = "markers/130.png";
                else if (km<150) iconType = "markers/140.png";
                else if (km<160) iconType = "markers/150.png";
                else if (km<170) iconType = "markers/160.png";
                else if (km<180) iconType = "markers/170.png";
                else if (km<190) iconType = "markers/180.png";
                else if (km<200) iconType = "markers/190.png";
                else if (km>=200) iconType = "markers/200.png";

                if (($scope.IsNumeric($scope.data[key]['lat']))&&($scope.IsNumeric($scope.data[key]['long']))) {
                    $scope.randomMarkers.push({"id":key ,"latitude": $scope.data[key]['lat'],"longitude": $scope.data[key]['long'],"icon":iconType, "title": 'Speed: ' + km + 'km/h\nTime: ' + $scope.data[key]['timestamp']})
                    $scope.polylines[0].path.push({"latitude": $scope.data[key]['lat'],"longitude": $scope.data[key]['long']});
                }
                else if ($scope.data[key]['event']=="RASPBERRY PI STARTED") $scope.events.push($scope.data[key]['timestamp'] + " : " + $scope.data[key]['event']);
                else if ($scope.data[key]['lat']=="NO GPS FIX") $scope.events.push($scope.data[key]['timestamp'] + " : " + $scope.data[key]['lat']);
                //console.log(key['pkey'] + " -> " + $scope.data[key]['alt']);
                //console.log($scope.data[key]['alt'] + " -> " + $scope.data[key]['alt']);
                //console.log("help");
              }
            }
        //$scope.map.clusterOptions={title: 'Hi I am a Cluster!', gridSize: 60, ignoreHidden: true, minimumClusterSize: 10};
        }).
        error(function(data, status, headers, config) {
        console.log("error")
        });

    };




    //for (var key in $scope.data) {
        //console.log(key);
      //if ($scope.data.hasOwnProperty(key)) {
        //console.log(key.alt + " -> " + $scope.data[key]['alt']);
      //}
    //}
    $scope.onClick = function() {
        console.log("Clicked!");
        $scope.show = !$scope.show;
    };

   
    $scope.newQuery();
    //$scope.title = "Window Title!";
    /*var createRandomMarker = function(i, bounds, idKey) {
      var lat_min = bounds.southwest.latitude,
        lat_range = bounds.northeast.latitude - lat_min,
        lng_min = bounds.southwest.longitude,
        lng_range = bounds.northeast.longitude - lng_min;

      if (idKey == null) {
        idKey = "id";
      }

      var latitude = lat_min + (Math.random() * lat_range);
      var longitude = lng_min + (Math.random() * lng_range);
      var ret = {
        latitude: latitude,
        longitude: longitude,
        title: 'm' + i
      };
      ret[idKey] = i;
      return ret;
    };
    $scope.randomMarkers = [];
    // Get the bounds from the map once it's loaded
    $scope.$watch(function() {
      return $scope.map.bounds;
    }, function(nv, ov) {
      // Only need to regenerate once
      if (!ov.southwest && nv.southwest) {
        var markers = [];
        for (var i = 0; i < 50; i++) {
          markers.push(createRandomMarker(i, $scope.map.bounds))
        }
        $scope.randomMarkers = markers;
      }
    }, true);
    */
    //$scope.showDetail = function(index) {
    //var selectedItem = $scope.posts[index];
    //PostsData.selectedItem = selectedItem;
    //$scope.ons.navigator.pushPage('post.html', selectedItem);
    //}

}]);