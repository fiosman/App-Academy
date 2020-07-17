class MarkerManger {
  constructor(map) {
    this.map = map;
    this.markers = {};
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
    const marker = new google.maps.Marker({
      position: { lat: bench.lat, lng: bench.lng },
      map: this.map,
      title: bench.description,
    });
    this.markers[bench.id] = marker;
  }

  removeMarker(markerId) {
    this.markers[markerId].setMap(null);
    delete this.markers[markerId];
  }
}

export default MarkerManger;
