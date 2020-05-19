const allTodos = (state) =>
  Object.keys(state.todos).map((key) => state.todos[key]);

export default allTodos;
