import React from "react";

class Signup extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      email: "",
      password: "",
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(type) {
    return (e) => {
      this.setState({ [type]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props
      .createNewUser(this.state)
      .then(() => this.props.history.push("/chirps"));
  }

  render() {
    return (
      <div className="session-form">
        <h2>Sign up!</h2>
        <form>
          <lablel>
            Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.handleInput("username")}
            />
          </lablel>
          <lablel>
            Email:
            <input
              type="text"
              value={this.state.email}
              onChange={this.handleInput("email")}
            />
          </lablel>
          <lablel>
            Password:
            <input
              type="password"
              value={this.state.password}
              onChange={this.handleInput("password")}
            />
          </lablel>
          <button onClick={this.handleSubmit}>Sign Up</button>
        </form>
      </div>
    );
  }
}

export default Signup;
