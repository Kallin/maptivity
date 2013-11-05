this.google = {
    maps: {
        event: {
            addDomListener: function() {
                return "";
            }
        }
    }
};

google.maps.LatLng = (function() {

    function LatLng(lat, lng) {
        this.latitude = parseFloat(lat);
        this.longitude = parseFloat(lng);
    }

    LatLng.prototype.lat = function() {
        return this.latitude;
    };

    LatLng.prototype.lng = function() {
        return this.longitude;
    };

    return LatLng;

})();

google.maps.LatLngBounds = (function() {

    function LatLngBounds(ne, sw) {
        this.ne = ne;
        this.sw = sw;
    }

    LatLngBounds.prototype.getSouthWest = function() {
        return this.sw;
    };

    LatLngBounds.prototype.getNorthEast = function() {
        return this.ne;
    };

    return LatLngBounds;

})();

google.maps.OverlayView = (function() {

    function OverlayView() {}

    return OverlayView;

})();

google.maps.Marker = (function() {

    function Marker() {}

    return Marker;

})();

google.maps.MarkerImage = (function() {

    function MarkerImage() {}

    return MarkerImage;

})();

google.maps.Map = (function() {

    function Map() {}

    return Map;

})();

google.maps.Point = (function() {

    function Point() {}

    return Point;

})();

google.maps.Size = (function() {

    function Size() {}

    return Size;

})();
