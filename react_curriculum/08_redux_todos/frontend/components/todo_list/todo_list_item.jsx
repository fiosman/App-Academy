import React from "react";

class TodoListItem extends React.Component { 
  constructor(props) { 
    super(props); 
    this.handleSubmit = this.handleSubmit.bind(this); 
  }

  handleSubmit() { 
    this.props.removeTodo(this.props.todo)
  }

  render() { 
    return (
      <div>
        <li>
          {this.props.todo.title}
          <button onClick={this.handleSubmit}>Delete</button>
        </li>
      </div>
    )
  }
}

export default TodoListItem;
