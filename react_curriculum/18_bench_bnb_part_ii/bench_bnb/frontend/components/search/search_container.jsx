import { connect } from "react-redux";
import Search from "./search";
import { updateFilter } from '../../actions/filter_actions';

const mapStateToProps = (state) => ({
  benches: state.entities.benches,
  minSeating: state.ui.filters.minSeating, 
  maxSeating: state.ui.filters.maxSeating,
});

const mapDispatchToProps = (dispatch) => ({
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value)),
});

export default connect(mapStateToProps, mapDispatchToProps)(Search);