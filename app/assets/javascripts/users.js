var initialize = function() {
  var $latitudeDisplay = $('#latitude');
  var $longitudeDisplay = $('#longitude');
  var defaultPos = {lat: -33.76281, lng: 151.298816};

  // Update latlng displays
  $latitudeDisplay.val(userPos.lat || defaultPos.lat);
  $longitudeDisplay.val(userPos.lng || defaultPos.lng);

  var mapOptions = {
    center: userPos || defaultPos,
    zoom: 15
  };

  var map = new google.maps.Map(document.getElementById('mapCanvas'), mapOptions);

  var userMarker = new google.maps.Marker({
    position: userPos || defaultPos,
    draggable: true,
    map: map
  });

  circle = new google.maps.Circle({
          map: map,
          clickable: false,
          radius: 100,
          fillColor: '#fff',
          fillOpacity: 0.6,
          strokeColor: '#313131',
          strokeOpacity: 0.4,
          strokeWeight: 0.8
      });

  // attach circle to userMarker
  circle.bindTo('center', userMarker, 'position');

  google.maps.event.addListener(userMarker, 'drag', function() {
    var markerPos = userMarker.getPosition();
    $latitudeDisplay.val(markerPos.A);
    $longitudeDisplay.val(markerPos.F);
  });
};
google.maps.event.addDomListener(window, 'load', initialize);
