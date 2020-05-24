const allTodos = (state) =>
  Object.keys(state.todos).map((key) => state.todos[key]);

export const stepsByTodoId = (state, todoId) => {
  let stepsArr = [];
  Object.keys(state.steps).forEach((stepId) => {
    const step = state.steps[stepId];
    if (step.todoId === todoId) {
      stepsArr.push(step);
    }
  });

  return stepsArr;
};

export default allTodos;
