import React from "react";
import { Link } from "react-router-dom";

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    const currInput = e.target.name;

    return this.setState({ [currInput]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.processForm(this.state).then(() => this.props.history.push("/"));
  }

  formHeader() {
    const typeValue = this.props.formType === "login" ? "Login" : "Sign up";

    return (
      <form>
        <h2>{typeValue}</h2>
        <label>
          Username:
          <input
            name="username"
            type="text"
            onChange={this.handleInput}
            value={this.state.username}
          />
        </label>
        <label>
          Password:
          <input
            name="password"
            type="password"
            onChange={this.handleInput}
            value={this.state.password}
          />
        </label>
        <button onClick={this.handleSubmit}>{typeValue}</button>
      </form>
    );
  }

  displayErrors() {
    return (
      <ul>
        {this.props.errors.map((error, idx) => {
          return <li key={idx}>{error}</li>;
        })}
      </ul>
    );
  }

  render() {
    const errors = this.props.errors ? this.displayErrors() : "";
    return (
      <div>
        {this.props.navLink}
        {this.formHeader()}
        {errors}
      </div>
    );
  }
}

export default SessionForm;
