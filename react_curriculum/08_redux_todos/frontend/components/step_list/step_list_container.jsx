import { stepsByTodoId } from "../../reducers/selectors";
import { receiveStep } from "../../actions/step_actions";
import { connect } from "react-redux";
import StepList from "./step_list";

const mapStateToProps = (state, ownProps) => ({
  steps: stepsByTodoId(state, ownProps.todoId),
  todoId: ownProps.todoId,
});

const mapDispatchToProps = (dispatch) => ({
  receiveStep: (step) => dispatch(receiveStep(step)),
});

export default connect(mapStateToProps, mapDispatchToProps)(StepList);
