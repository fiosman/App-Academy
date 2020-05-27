import { connect } from 'react-redux'; 
import TodoList from './todo_list.jsx'; 
import allTodos from '../../reducers/selectors'
import { receiveTodo, requestTodos, createTodo } from '../../actions/todo_actions.js';

const mapStateToProps = state => ({ 
  todos: allTodos(state)
})

const mapDispatchToProps = dispatch => ({ 
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  requestTodos: todos => dispatch(requestTodos(todos)), 
  createTodo: todo => dispatch(createTodo(todo))
})

export default connect(
  mapStateToProps, 
  mapDispatchToProps
)(TodoList);