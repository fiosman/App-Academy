import React from "react";
import MarkerManager from "../../util/marker_manager";
import { withRouter } from "react-router-dom";

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435 }, // this is SF
      zoom: 13,
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.markerManager = new MarkerManager(this.map);
    this.markerManager.updateMarkers(this.props.benches);

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

  componentDidUpdate() {
    this.markerManager.updateMarkers(this.props.benches);
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
