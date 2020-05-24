import { removeTodo } from "../../actions/todo_actions";
import { receiveSteps } from "../../actions/step_actions";
import { connect } from "react-redux";
import TodoDetailView from "./todo_detail_view";

const mapDispatchToProps = (dispatch) => ({
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  receiveSteps: (steps) => dispatch(receiveSteps(steps)),
});

export default connect(null, mapDispatchToProps)(TodoDetailView);
