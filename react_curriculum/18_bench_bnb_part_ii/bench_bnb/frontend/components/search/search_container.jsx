import { connect } from "react-redux";
import Search from "./search";
import { getBenches } from '../../actions/bench_actions';

const mapStateToProps = (state) => ({
  benches: state.entities.benches,
});

const mapDispatchToProps = (dispatch) => ({
  fetchBenches: () => dispatch(getBenches()),
});

export default connect(mapStateToProps, mapDispatchToProps)(Search);