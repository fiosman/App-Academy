import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.toggleStep = this.toggleStep.bind(this);
  }

  toggleStep() {
    const toggledStep = Object.assign({}, this.props.step, {
      done: !this.props.step.done,
    });
    this.props.receiveStep(toggledStep);
  }

  render() {
    const title = this.props.step.title;
    const body = this.props.step.body;

    return (
      <li className="step-header">
        <div className="step-info">
          <span>{title}</span>
          <p>{body}</p>
        </div>
        <div className="step-buttons">
          <button
            className={this.props.step.done ? "done" : "undone"}
            onClick={this.toggleStep}
          >
            {this.props.step.done ? "Undo" : "Done"}
          </button>
          <button
            className="delete-button"
            onClick={() => this.props.removeStep(this.props.step)}
          >
            Delete
          </button>
        </div>
      </li>
    );
  }
}

export default StepListItem;
