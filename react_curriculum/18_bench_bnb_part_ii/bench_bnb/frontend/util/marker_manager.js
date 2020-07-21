class MarkerManger {
  constructor(map, clickHandler) {
    this.map = map;
    this.markers = {};
    this.clickHandler = clickHandler;
  }

  updateMarkers(benches) {
    Object.keys(benches).forEach((benchId) => {
      if (!this.markers[benchId]) {
        this.createMarkerFromBench(benches[benchId]);
      }
    });

    Object.keys(this.markers).forEach((markerId) => {
      if (!benches[markerId]) {
        this.removeMarker(markerId);
      }
    });
  }

  createMarkerFromBench(bench) {
    const position = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps.Marker({
      position,
      map: this.map,
      title: bench.description,
      benchId: bench.id,
    });

    this.markers[bench.id] = marker;

    marker.addListener("click", () => {
      this.markers.selectedMarker = marker.get("benchId");
      this.clickHandler();
    });
  }

  removeMarker(markerId) {
    this.markers[markerId].setMap(null);
    delete this.markers[markerId];
  }
}

export default MarkerManger;
