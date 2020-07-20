import React from "react";

const BenchDetail = (props) => {
  return (
    <div>
      <ul>
        <li>Description: {props.bench.description}</li>
        <li>Seats: {props.bench.seating}</li>
        <li>Latitude: {props.bench.lat}</li>
        <li>Longitude: {props.bench.lng}</li>
      </ul>
    </div>
  );
};

export default BenchDetail;
