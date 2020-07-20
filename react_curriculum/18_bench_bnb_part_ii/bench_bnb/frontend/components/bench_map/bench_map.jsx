import React from "react";
import MarkerManager from "../../util/marker_manager";
import { withRouter } from "react-router-dom";

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const bench = this.props.benches[this.props.benchId];
    let mapOptions = {
      center: {},
      zoom: 13,
    };
    if (this.props.singleBench) {
      mapOptions.center.lat = bench.lat;
      mapOptions.center.lng = bench.lng;
      mapOptions.zoomControl = false;
      mapOptions.gestureHandling = "none";
    } else {
      mapOptions.center.lat = 37.7758;
      mapOptions.center.lng = -122.435;
    }
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.markerManager = new MarkerManager(this.map);
    this.markerManager.updateMarkers(this.props.benches);

    if (this.props.singleBench) {
      this.props.fetchBench(this.props.benchId);
    } else {
      this.map.addListener("idle", () => {
        const northEast = this.map.getBounds().getNorthEast();
        const southWest = this.map.getBounds().getSouthWest();
        const bounds = {
          northEast: { lat: northEast.lat(), lng: northEast.lng() },
          southWest: { lat: southWest.lat(), lng: southWest.lng() },
        };
        this.props.updateFilter("bounds", bounds);
      });

      this.map.addListener("click", (event) => {
        const coords = {
          lat: event.latLng.lat(),
          lng: event.latLng.lng(),
        };
        return this._handleClick(coords);
      });
    }
  }

  componentDidUpdate() {
    if (this.props.singleBench) {
      const bench = this.props.benches[this.props.benchId];
      const mapOptions = {
        center: { lat: bench.lat, lng: bench.lng },
        zoom: 13,
        zoomControl: false,
        gestureHandling: "none",
      };
      this.map = new google.maps.Map(this.mapNode, mapOptions);
      this.markerManager = new MarkerManager(this.map);
      this.markerManager.updateMarkers(this.props.benches);
    } else {
      this.markerManager.updateMarkers(this.props.benches);
    }
  }

  _handleClick(coords) {
    this.props.history.push({
      pathname: "/benches/new",
      search: `lat=${coords.lat}&lng=${coords.lng}`,
    });
  }

  render() {
    return <div ref={(map) => (this.mapNode = map)} id="map-container"></div>;
  }
}

export default withRouter(BenchMap);
