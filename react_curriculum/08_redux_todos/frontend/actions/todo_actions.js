export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

let receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos,
});

let receiveTodo = (todo) => ({
  type: RECEIVE_TODO, 
  todo,
}); 