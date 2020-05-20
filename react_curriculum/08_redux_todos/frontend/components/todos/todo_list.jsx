import React from "react";
import TodoListItem from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_form";

const TodoList = (props) => {
  const items = (
    <ul>
      {props.todos.map((todo, idx) => (
        <div key={idx}>
          <TodoListItem todo={todo} />
        </div>
      ))}
    </ul>
  );

  return ( 
    <div>
      {items}
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  )
};

export default TodoList;
