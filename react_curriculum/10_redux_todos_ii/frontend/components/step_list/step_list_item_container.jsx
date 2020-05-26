import { removeStep, receiveStep } from "../../actions/step_actions";
import StepListItem from "./step_list_item";
import { connect } from "react-redux";

const mapDispatchToProps = (dispatch) => ({
  removeStep: (step) => dispatch(removeStep(step)),
  receiveStep: (step) => dispatch(receiveStep(step)),
});

export default connect(null, mapDispatchToProps)(StepListItem);
