import React from "react";
import ReviewIndex from './review_index';

const BenchDetail = (props) => {
  return (
    <div>
      <ul>
        <li>Rating: {props.bench.rating || "Not yet rated"}</li>
        <li>Description: {props.bench.description}</li>
        <li>Seats: {props.bench.seating}</li>
        <li>Latitude: {props.bench.lat}</li>
        <li>Longitude: {props.bench.lng}</li>
      </ul>
      <ReviewIndex bench={props.bench} />
    </div>
  );
};

export default BenchDetail;
