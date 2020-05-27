export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import * as APIUtil from "../util/todo_api_util";

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
  return APIUtil.fetchTodos().then((todos) => {
    dispatch(receiveTodos(todos));
  });
};
