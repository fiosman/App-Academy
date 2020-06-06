import { stepsByTodoId } from "../../reducers/selectors";
import { createStep } from "../../actions/step_actions"
import { connect } from "react-redux";
import StepList from "./step_list";

const mapStateToProps = (state, ownProps) => ({
  steps: stepsByTodoId(state, ownProps.todo_Id),
  todoId: ownProps.todo_id,
});

const mapDispatchToProps = (dispatch) => ({
  createStep: (...args) => dispatch(createStep(...args)),
});

export default connect(mapStateToProps, mapDispatchToProps)(StepList);
