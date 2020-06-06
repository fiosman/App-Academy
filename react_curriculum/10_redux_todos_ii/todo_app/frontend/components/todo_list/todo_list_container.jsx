import { connect } from "react-redux";
import TodoList from "./todo_list.jsx";
import { allTodos }  from "../../reducers/selectors";
import {
  requestTodos,
  createTodo,
  updateTodo
} from "../../actions/todo_actions.js";

const mapStateToProps = (state) => ({
  todos: allTodos(state),
  errors: state.errors,
});

const mapDispatchToProps = (dispatch) => ({
  requestTodos: (todos) => dispatch(requestTodos(todos)),
  createTodo: (todo) => dispatch(createTodo(todo)),
  updateTodo: (todo) => dispatch(updateTodo(todo)),
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
