export const allTodos = (state) =>
  Object.keys(state.todos).map((key) => state.todos[key]);

export const stepsByTodoId = (state, todoId) => {
  let stepsArr = [];
  Object.keys(state.steps).forEach((stepId) => {
    if (state.steps[stepId].todoId === todoId) {
      stepsArr.push(step);
    }
  });

  return stepsArr;
};
