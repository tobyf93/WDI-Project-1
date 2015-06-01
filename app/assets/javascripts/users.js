var heatmapData = [
  new google.maps.LatLng(37.782, -122.447),
  new google.maps.LatLng(37.782, -122.445),
  new google.maps.LatLng(37.782, -122.443),
  new google.maps.LatLng(37.782, -122.441),
  new google.maps.LatLng(37.782, -122.439),
  new google.maps.LatLng(37.782, -122.437),
  new google.maps.LatLng(37.782, -122.435),
  new google.maps.LatLng(37.785, -122.447),
  new google.maps.LatLng(37.785, -122.445),
  new google.maps.LatLng(37.785, -122.443),
  new google.maps.LatLng(37.785, -122.441),
  new google.maps.LatLng(37.785, -122.439),
  new google.maps.LatLng(37.785, -122.437),
  new google.maps.LatLng(37.785, -122.435)
];

var initialize = function() {
  var $latitudeDisplay = $('#latitude');
  var $longitudeDisplay = $('#longitude');
  var defaultPos = {lat: -33.76281, lng: 151.298816};

  // Update latlng displays
  $latitudeDisplay.val(gon.userPos.lat || defaultPos.lat);
  $longitudeDisplay.val(gon.userPos.lng || defaultPos.lng);

  var sanFrancisco = new google.maps.LatLng(37.774546, -122.433523);
  var mapOptions = {
    center: sanFrancisco,//gon.userPos || defaultPos,
    zoom: 15
  };

  var map = new google.maps.Map(document.getElementById('mapCanvas'), mapOptions);

  var userMarker = new google.maps.Marker({
    position: gon.userPos || defaultPos,
    draggable: gon.draggable,
    map: map
  });

  userBoundary = new google.maps.Circle({
    map: map,
    clickable: false,
    radius: 100,
    fillColor: '#fff',
    fillOpacity: 0.6,
    strokeColor: '#313131',
    strokeOpacity: 0.4,
    strokeWeight: 0.8,
  });

  // attach circle to userMarker
  userBoundary.bindTo('center', userMarker, 'position');

  google.maps.event.addListener(userMarker, 'drag', function() {
    var markerPos = userMarker.getPosition();
    $latitudeDisplay.val(markerPos.A);
    $longitudeDisplay.val(markerPos.F);
  });

  gon.items.forEach(function(item) {
    new google.maps.Marker({
      position: item,
      icon: gon.iconPath,
      map: map
    });
  });

  var heatmap = new google.maps.visualization.HeatmapLayer({
  data: heatmapData
});
heatmap.setMap(map);

};

if (gon._enabled)google.maps.event.addDomListener(window, 'load', initialize);
