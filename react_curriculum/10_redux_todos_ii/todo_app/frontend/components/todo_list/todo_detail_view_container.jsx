import { deleteTodo } from "../../actions/todo_actions";
import { receiveSteps } from "../../actions/step_actions";
import { connect } from "react-redux";
import TodoDetailView from "./todo_detail_view";

const mapDispatchToProps = (dispatch) => ({
  deleteTodo: (todo) => dispatch(deleteTodo(todo)),
  receiveSteps: (steps) => dispatch(receiveSteps(steps)),
});

export default connect(null, mapDispatchToProps)(TodoDetailView);
