import { connect } from "react-redux";
import ReviewForm from "./review_form";
import { postReview } from "../../actions/bench_actions";

const mapStateToProps = (state, ownProps) => ({
  benchId: ownProps.match.params.benchId,
});

const mapDispatchToProps = (dispatch) => ({
  createReview: (reviewData) =>
    dispatch(postReview(reviewData)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ReviewForm);
