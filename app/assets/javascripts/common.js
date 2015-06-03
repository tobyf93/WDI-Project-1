$(document).ready(function() {
  navigator.geolocation.getCurrentPosition(success, error, options);
});

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

var success = function(pos) {
  var crd = pos.coords;

  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');

  $.cookie('location', utf8_to_b64(crd.latitude + ',' + crd.longitude));
};

var error = function(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

var utf8_to_b64 = function( str ) {
  return window.btoa(unescape(encodeURIComponent( str )));
};

