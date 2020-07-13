import React from "react";
import MarkerManager from '../../util/marker_manager';

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
  }

  componentDidUpdate() { 
    this.markerManager.updateMarkers(this.props.benches);
  }

  render() {
    return <div ref={(map) => (this.mapNode = map)} id="map-container"></div>;
  }
}

export default BenchMap;
