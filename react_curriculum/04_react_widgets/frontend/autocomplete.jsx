import React from "react";

class NameSearch extends React.Component {
  constructor(props) {
    super(props);
    this.updateInput = this.updateInput.bind(this);
  }

  updateInput(e) {
    this.props.searchState(e.target.value);
  }

  render() {
    return <input type="text" onChange={this.updateInput} />;
  }
}

export default class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = { inputVal: "" };
    this.updateState = this.updateState.bind(this);
  }

  filterNames(val) {
    return this.props.names.filter((ele) =>
      ele.toLowerCase().startsWith(val.toLowerCase())
    );
  }

  updateState(searchVal) {
    this.setState({ inputVal: searchVal });
  }

  render() {
    const filteredNames = this.filterNames(
      this.state.inputVal
    ).map((ele, idx) => <li key={idx}>{ele}</li>);

    return (
      <div>
        <NameSearch searchState={this.updateState} />
        <ul>{filteredNames}</ul>
      </div>
    );
  }
}
