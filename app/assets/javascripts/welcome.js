//= require underscore
//= require gmaps/google
function init() {
  var map_canvas = document.getElementById('map');
  var map_options = {
    center: new google.maps.LatLng(54.3224699, 48.3568821),
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(map_canvas, map_options);
  var myLatLng = new google.maps.LatLng(54.3224699, 48.3568821);
  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    icon: 'assets/rails.png'
  });
}
init();
