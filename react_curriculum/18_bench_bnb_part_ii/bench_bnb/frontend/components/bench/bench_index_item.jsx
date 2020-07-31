import React from "react";
import { withRouter } from "react-router-dom";
class BenchIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.history.push(`/benches/${this.props.bench.id}`);
  }

  render() {
    return ( 
      <ul>
        <li onClick={this.handleClick}>{this.props.bench.description}</li>
        {/* <li><img src={this.props.bench.photoUrl}></img></li> */}
      </ul>
    )
  }
}

export default withRouter(BenchIndexItem);
