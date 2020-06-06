export const allTodos = (state) =>
  Object.keys(state.todos).map((key) => state.todos[key]);

export const stepsByTodoId = ({ steps }, todo_id) => {
  const stepsByTodoId = [];
  Object.keys(steps).forEach((stepId) => {
    const step = steps[stepId];
    if (steps[stepId].todo_id === todo_id) stepsByTodoId.push(step);
  });
  return stepsByTodoId;
};

