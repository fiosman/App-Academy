import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

const TodoList = (props) => {
  const items = (
    <ul>
      {props.todos.map((todo, idx) => (
        <div key={idx}>
          <TodoListItem
            todo={todo}
            receiveTodo={props.receiveTodo}
            removeTodo={props.removeTodo}
          />
        </div>
      ))}
    </ul>
  );

  return (
    <div>
      {items}
      <TodoForm receiveTodo={props.receiveTodo} />
    </div>
  );
};

export default TodoList;
