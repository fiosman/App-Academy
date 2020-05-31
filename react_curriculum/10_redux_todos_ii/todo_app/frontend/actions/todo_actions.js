export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import * as APIUtil from "../util/todo_api_util";
import { receiveErrors, clearErrors } from "../actions/error_actions";

export let receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos,
});

export let receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo,
});

export let removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo,
});

export const requestTodos = () => (dispatch) => {
  return APIUtil.fetchTodos().then((todos) => dispatch(receiveTodos(todos)));
};

export const createTodo = (todo) => (dispatch) =>
  APIUtil.createTodo(todo).then(
    (todo) => {
      dispatch(receiveTodo(todo));
      dispatch(clearErrors());
    },
    (err) => dispatch(receiveErrors(err.responseJSON))
  );

export const updateTodo = (todo) => (dispatch) =>
  APIUtil.updateTodo(todo).then((todo) => dispatch(receiveTodo(todo)));

export const deleteTodo = (todo) => (dispatch) =>
  APIUtil.deleteTodo(todo).then((res) => dispatch(removeTodo(res)));
