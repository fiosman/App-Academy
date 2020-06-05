import { stepsByTodoId } from "../../reducers/selectors";
import { receiveStep } from "../../actions/step_actions";
import { createStep } from "../../actions/step_actions"
import { connect } from "react-redux";
import StepList from "./step_list";

const mapStateToProps = (state, ownProps) => ({
  steps: stepsByTodoId(state, ownProps.todoId),
  todoId: ownProps.todoId,
});

const mapDispatchToProps = (dispatch) => ({
  createStep: (...args) => dispatch(createStep(...args)),
});

export default connect(mapStateToProps, mapDispatchToProps)(StepList);
