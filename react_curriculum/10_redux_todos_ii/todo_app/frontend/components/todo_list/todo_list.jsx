import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestTodos();
  }

  render() {
    console.log('TODOLIST HAS BEEN RE-RENDERED!') //This is interesting, if I modify the props in TodoListItem, it will re-render TodoList"
    const items = (
      <ul>
        {this.props.todos.map((todo, idx) => (
          <div key={idx}>
            <TodoListItem
              key={todo.id}
              todo={todo}
              receiveTodo={this.props.receiveTodo}
              updateTodo={this.props.updateTodo}
            />
          </div>
        ))}
      </ul>
    );

    return (
      <div>
        <TodoForm
          createTodo={this.props.createTodo}
          errors={this.props.errors}
        />
        <ul className="todo-list">{items}</ul>
      </div>
    );
  }
}

export default TodoList;
