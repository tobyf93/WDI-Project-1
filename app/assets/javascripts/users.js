var initialize = function() {
  var $latitudeDisplay = $('#latitude');
  var $longitudeDisplay = $('#longitude');

  // Update latlng displays
  $latitudeDisplay.val(gon.userPos.lat);
  $longitudeDisplay.val(gon.userPos.lng);

  var mapOptions = {
    center: gon.userPos,
    zoom: 15
  };

  var map = new google.maps.Map(document.getElementById('mapCanvas'), mapOptions);

  var userMarker = new google.maps.Marker({
    position: gon.userPos,
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

  var heatmapData = [];
  gon.items.forEach(function(item) {
    heatmapData.push(new google.maps.LatLng(item.lat, item.lng));
  });

  var heatmap = new google.maps.visualization.HeatmapLayer({
    data: heatmapData
  });

  heatmap.set('radius', 20);
  heatmap.setMap(map);

  var $geolocToggle = $("[name='use_geoloc']");
  $geolocToggle.bootstrapSwitch({labelText: 'GeoLocation'});
  $geolocToggle.on('switchChange.bootstrapSwitch', function(event, state) {
    $textFields = $('#location [type="text"]');
    if (state) {
      $textFields.attr('disabled', 'disabled');
      userMarker.draggable = false;
    } else {
      $textFields.removeAttr('disabled');
      userMarker.draggable = true;
    }
  });
};

if (gon._enabled)google.maps.event.addDomListener(window, 'load', initialize);
