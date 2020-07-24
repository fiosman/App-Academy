import React from "react";
import BenchMap from "../bench_map/bench_map";
import BenchDetail from "./bench_detail";
import { Link } from 'react-router-dom';

const BenchShow = (props) => {
  const benches = {
    [props.benchId]: props.bench,
  };
  const bench = props.bench;
  return (
    <div>
      <BenchMap
        benches={benches}
        benchId={props.benchId}
        singleBench={true}
        fetchBench={props.fetchBench}
      />
      <BenchDetail bench={bench} />
      <Link to={`/benches/${props.benchId}/review`}>Leave a Review</Link>
    </div>
  );
};
export default BenchShow;
