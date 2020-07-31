import React from "react";

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      seating: "",
      lat: this.props.lat || "",
      lng: this.props.lng || "",
      photoFile: null,
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleFile = this.handleFile.bind(this);
  }

  handleInput(e) {
    return this.setState({ [e.target.name]: e.target.value });
  }

  handleFile(e) { 
    return this.setState({photoFile: e.currentTarget.files[0]});
  }

  handleSubmit(e) {
    e.preventDefault();
    const formData = new FormData();
    formData.append('bench[description]', this.state.description) 
    formData.append('bench[seating]', this.state.seating)
    formData.append('bench[lat]', this.state.lat)
    formData.append('bench[lng]', this.state.lng); 
    formData.append('bench[photo]', this.state.photoFile);
    return this.props
      .createBench(formData)
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
        <label>
          Image:
          <input type="file" onChange={this.handleFile}/>
        </label>
        <input type="button" onClick={this.handleSubmit} value="Submit" />
      </form>
    );
  }
}

export default BenchForm;
