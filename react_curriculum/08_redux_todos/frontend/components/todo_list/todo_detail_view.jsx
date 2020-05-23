import React from "react";

const TodoDetailView = (props) => {
  const removeTodo = props.removeTodo;
  const todo = props.todo;
  return (
    <div>
      <button onClick={() => removeTodo(todo)}>Delete</button>
    </div>
  );
};

export default TodoDetailView;
