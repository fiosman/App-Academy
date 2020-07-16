import React from "react";
import BenchMap from "../bench_map/bench_map";
import BenchIndex from "../bench/bench_index";

const Search = (props) => (
  <div>
    <BenchMap
      fetchBenches={props.fetchBenches}
      benches={props.benches}
      updateBounds={props.updateBounds}
      filters={props.filters}
    />
    <BenchIndex benches={props.benches} />
  </div>
);

export default Search;
