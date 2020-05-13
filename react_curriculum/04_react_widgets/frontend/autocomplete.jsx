import React from "react";
import ReactCSSTransitionGroup from "react-addons-css-transition-group";

class NameSearch extends React.Component {
  constructor(props) {
    super(props);
    this.updateInput = this.updateInput.bind(this);
  }

  updateInput(e) {
    this.props.searchState(e.target.value);
  }

  render() {
    return (
      <input
        className="auto-search"
        type="text"
        placeholder="Search..."
        onChange={this.updateInput}
      />
    );
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
    const filteredNames = this.filterNames(this.state.inputVal).map(
      (ele, idx) => (
        <li className="name" key={idx}>
          {" "}
          {ele}
        </li>
      )
    );

    return (
      <div>
        <h1>Autocomplete</h1>
        <div className="auto-container">
          <NameSearch searchState={this.updateState} />
          <ul className="name-list">
            <ReactCSSTransitionGroup
              transitionName="auto"
              transitionEnterTimeout={500}
              transitionLeaveTimeout={500}
            >
              {filteredNames}
            </ReactCSSTransitionGroup>
          </ul>
        </div>
      </div>
    );
  }
}
