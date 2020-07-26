import { connect } from "react-redux";
import BenchShow from "./bench_show";
import { getBench } from "../../actions/bench_actions";

const mapStateToProps = (state, ownProps) => {
  const bench =  state.entities.benches[ownProps.match.params.benchId];
  const benchId = ownProps.match.params.benchId;
  const benches =  state.entities.benches;
  return { 
    benchId, 
    bench,
    benches,
  }
}

const mapDispatchToProps = (dispatch) => ({
  fetchBench: (benchId) => dispatch(getBench(benchId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(BenchShow);
