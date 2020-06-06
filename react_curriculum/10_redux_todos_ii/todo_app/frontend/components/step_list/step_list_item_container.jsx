import { connect } from "react-redux";
import StepListItem from "./step_list_item";
import { updateStep, destroyStep } from "../../actions/step_actions";

const mapDispatchToProps = (dispatch, { step }) => ({
  destroyStep: () => dispatch(destroyStep(step)),
  updateStep: (updatedStep) => dispatch(updateStep(updatedStep)),
});

export default connect(null, mapDispatchToProps)(StepListItem);


