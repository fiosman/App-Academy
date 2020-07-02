import React from "react";

class Login extends React.Component {
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
    return this.setState({ 
      [currInput]: e.target.value
    })
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props
      .loginUser(this.state)
      .then(() => this.props.history.push("/chirps"));
  }

  render() {
    return (
      <section className="session-form">
        <h2>Log in!</h2>
        <form>
          <label>
            Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.handleInput}
              name="username"
            />
          </label>
          <label>
            Password:
            <input
              type="password"
              value={this.state.password}
              onChange={this.handleInput}
              name="password"
            />
          </label>
          <button onClick={this.handleSubmit}>Login</button>
        </form>
      </section>
    );
  }
}

export default Login;
