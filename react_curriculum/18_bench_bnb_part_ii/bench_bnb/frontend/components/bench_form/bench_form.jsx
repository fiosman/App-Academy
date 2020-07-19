import React from "react";

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      seating: "",
      lat: this.props.lat || "",
      lng: this.props.lng || "",
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    return this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    return this.props
      .createBench(this.state)
      .then(this.props.history.push("/"));
  }

  render() {
    return (
      <form>
        <h2>Create a bench!</h2>
        <label>
          Description:
          <input
            type="text"
            name="description"
            value={this.state.description}
            onChange={this.handleInput}
          />
        </label>
        <label>
          Latitude:
          <input
            type="text"
            name="lat"
            value={this.state.lat}
            disabled
          />
        </label>
        <label>
          Longitude:
          <input
            type="text"
            name="lng"
            value={this.state.lng}
            disabled
          />
        </label>
        <label>
          Number of Seats:
          <input
            type="number"
            name="seating"
            value={this.state.seating}
            onChange={this.handleInput}
          />
        </label>
        <input type="button" onClick={this.handleSubmit} value="Submit" />
      </form>
    );
  }
}

export default BenchForm;
