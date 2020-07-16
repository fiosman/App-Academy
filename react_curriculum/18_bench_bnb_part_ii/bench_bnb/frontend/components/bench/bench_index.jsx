import React from "react";
import BenchIndexItem from "./bench_index_item";

class BenchIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const benchKeys = Object.keys(this.props.benches);
    const benches = this.props.benches;
    return (
      <ul>
        {benchKeys.map((benchId, key) => {
          return <BenchIndexItem bench={benches[benchId]} key={key} />;
        })}
      </ul>
    );
  }
}

export default BenchIndex;
