import React from "react";
import BenchMap from "../bench_map/bench_map";
import BenchIndex from "../bench/bench_index";

const Search = (props) => (
  <div>
    <BenchMap
      benches={props.benches}
      changeBounds={props.changeBounds}
    />
    <BenchIndex benches={props.benches} />
  </div>
);

export default Search;
