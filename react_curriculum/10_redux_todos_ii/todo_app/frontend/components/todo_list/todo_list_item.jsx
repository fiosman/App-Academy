import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };
    this.updateProgress = this.updateProgress.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
  }

  updateProgress() {
    const todo = this.props.todo
    this.props.todo.done = this.props.todo.done ? false : true;
    this.props.updateTodo(todo);
  }

  toggleDetail() {
    let detailStatus = this.state.detail === true ? false : true;
    this.setState({ detail: detailStatus });
  }

  render() {
    const todoProgress = this.props.todo.done ? "Undo" : "Done";
    const todoDetail = <TodoDetailViewContainer todo={this.props.todo} />;
    return (
      <div className="todo-header">
        <li className="todo-list-item">
          <span onClick={this.toggleDetail}>{this.props.todo.title}</span>
          <button
            className={this.props.todo.done ? " done" : "undone"}
            onClick={this.updateProgress}
          >
            {todoProgress}
          </button>
          {this.state.detail ? todoDetail : ""}
        </li>
      </div>
    );
  }
}

export default TodoListItem;
