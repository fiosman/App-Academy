import { connect } from "react-redux";
import BenchShow from "./bench_show";
import { getBench } from "../../actions/bench_actions";

const mapStateToProps = (state, ownProps) => ({
  bench: state.entities.benches[ownProps.match.params.benchId],
  benchId: ownProps.match.params.benchId,
  benches: state.entities.benches
});

const mapDispatchToProps = (dispatch) => ({
  fetchBench: (benchId) => dispatch(getBench(benchId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(BenchShow);
