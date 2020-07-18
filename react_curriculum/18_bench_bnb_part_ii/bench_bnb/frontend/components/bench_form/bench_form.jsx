import React from "react";

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      numSeats: "",
      latitude: this.props.lat,
      longitude: this.props.lng,
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    return this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    //invoke dispatch prop here which will send request to Rails API
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
            name="latitude"
            value={this.state.latitude}
            disabled
          />
        </label>
        <label>
          Longitude:
          <input
            type="text"
            name="longitude"
            value={this.state.longitude}
            disabled
          />
        </label>
        <label>
          Number of Seats:
          <input
            type="text"
            name="numSeats"
            value={this.state.numSeats}
            onChange={this.handleInput}
          />
        </label>
        <input type="button" onClick={this.handleSubmit} value="Submit" />
      </form>
    );
  }
}

export default BenchForm;
