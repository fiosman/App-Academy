import React from "react";
import { withRouter } from "react-router-dom";

class ReviewForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      rating: "",
      body: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleNavigation = this.handleNavigation.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    const property = e.target.name;
    this.setState({
      [property]: e.target.value,
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    const reviewData = Object.assign({}, this.state, {
      bench_id: this.props.benchId,
    });
    this.props.createReview(reviewData).then(this.handleNavigation());
  }

  handleNavigation() {
    return this.props.history.push(`/benches/${this.props.benchId}`);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Rating
          <input
            type="number"
            name="rating"
            value={this.state.rating}
            onChange={this.handleChange}
          />
        </label>
        <label>
          Comment
          <textarea
            value={this.state.body}
            name="body"
            onChange={this.handleChange}
          ></textarea>
        </label>
        <input type="submit" />
        <button onClick={this.handleNavigation}>Cancel</button>
      </form>
    );
  }
}

export default withRouter(ReviewForm);
