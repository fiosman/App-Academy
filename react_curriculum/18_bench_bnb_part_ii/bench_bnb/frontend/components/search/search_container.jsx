import { connect } from "react-redux";
import Search from "./search";
import { changeBounds } from '../../actions/filter_actions';

const mapStateToProps = (state) => ({
  benches: state.entities.benches,
  filters: state.filters
});

const mapDispatchToProps = (dispatch) => ({
  changeBounds: (bounds) => dispatch(changeBounds(bounds)),
});

export default connect(mapStateToProps, mapDispatchToProps)(Search);