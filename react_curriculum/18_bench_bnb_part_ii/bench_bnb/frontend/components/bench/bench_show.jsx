import React from "react";
import BenchMap from "../bench_map/bench_map";

const BenchShow = (props) => {
  const benches = {
    [props.benchId]: props.bench,
  };
  return (
    <div>
      <BenchMap
        benches={benches}
        benchId={props.benchId}
        singleBench={true}
        fetchBench={props.fetchBench}
      />
      <ul>
        <li>Description: {props.bench.description}</li>
        <li>Seats: {props.bench.seating}</li>
        <li>Latitude: {props.bench.lat}</li>
        <li>Longitude: {props.bench.lng}</li>
      </ul>
    </div>
  );
};
export default BenchShow;
