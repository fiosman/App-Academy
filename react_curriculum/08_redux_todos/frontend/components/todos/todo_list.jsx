import React from "react";
import TodoListItem from "../todo_list/todo_list_item";

const TodoList = (props) => {
  return (
    <ul>
      {props.todos.map((todo, idx) => (
        <div key={idx}>
          <TodoListItem todo={todo} />
        </div>
      ))}
    </ul>
  );
};

export default TodoList;
