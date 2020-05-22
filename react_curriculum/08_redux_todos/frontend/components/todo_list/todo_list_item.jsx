import React from "react";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
    this.updateProgress = this.updateProgress.bind(this);
  }

  handleDelete() {
    this.props.removeTodo(this.props.todo);
  }

  updateProgress() {
    this.props.todo.done = this.props.todo.done ? false : true;
    this.props.receiveTodo(this.props.todo);
  }

  render() {
    const todoProgress = this.props.todo.done ? "Undo" : "Done";
    return (
      <div>
        <li>
          {this.props.todo.title}
          <button onClick={this.handleDelete}>Delete</button>
          <button onClick={this.updateProgress}>{todoProgress}</button>
        </li>
      </div>
    );
  }
}

export default TodoListItem;
