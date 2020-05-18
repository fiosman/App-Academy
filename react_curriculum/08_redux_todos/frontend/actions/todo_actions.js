export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export let receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos,
});

export let receiveTodo = (todo) => ({
  type: RECEIVE_TODO, 
  todo,
}); 