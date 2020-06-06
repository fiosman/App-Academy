import React from "react";
import Util from "../../util/util";

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { body: "", title: "" };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    this.setState({
      [e.target.name]: e.target.value,
    });
  }

  handleSubmit(e) {
    console.log(this.props);
    e.preventDefault();

    const step = Object.assign({}, this.state); 
    this.props.createStep(step, this.props.todoId).then(() => this.setState({title: "", body: ""}))
  }

  handleInput(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  render() {
    return (
      <form className="step-form" onSubmit={this.handleSubmit}>
        <input
          className="input"
          type="text"
          value={this.state.title}
          name="title"
          onChange={this.handleInput}
        />
        <textarea
          className="input"
          type="text"
          name="body"
          value={this.state.body}
          onChange={this.handleInput}
        ></textarea>
        <input className="create-button" type="submit" value="Submit Step" />
      </form>
    );
  }
}

export default StepForm;
