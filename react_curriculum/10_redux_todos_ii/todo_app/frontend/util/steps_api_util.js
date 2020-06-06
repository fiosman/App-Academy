export const createStep = (todoId, step) => {
  return $.ajax({
    method: "POST",
    url: `api/todos/${todoId}/steps`,
    data: { step },
  });
};

export const deleteStep = (step) => {
  return $.ajax({
    method: "DELETE",
    url: `api/todos/${step.todo_id}/steps/${step.id}`,
  });
};

export const updateStep = (step) => {
  return $.ajax({
    method: "PUT",
    url: `api/todos/${step.todo_id}/steps/${step.id}`,
    data: { step },
  });
};

export const fetchSteps = (todoId) => {
  return $.ajax({
    method: "GET",
    url: `api/todos/${todoId}/steps`,
  });
};
