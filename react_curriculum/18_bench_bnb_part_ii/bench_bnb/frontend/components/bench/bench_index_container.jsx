import { connect } from "react-redux";
import BenchIndex from "./bench_index";
import { getBenches } from '../../actions/bench_actions';

const mapStateToProps = (state) => ({
  benches: state.entities.benches,
});

const mapDispatchToProps = (dispatch) => ({
  fetchBenches: () => dispatch(getBenches()),
});

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex);
