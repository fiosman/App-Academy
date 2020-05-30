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
    const items = (
      <ul>
        {this.props.todos.map((todo, idx) => (
          <div key={idx}>
            <TodoListItem
              key={todo.id}
              todo={todo}
              receiveTodo={this.props.receiveTodo}
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
