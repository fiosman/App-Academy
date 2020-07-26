import { RECEIVE_REVIEW } from "../actions/bench_actions";
import { RECEIVE_BENCH } from "../actions/bench_actions";

const reviewsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_BENCH:
      return Object.assign({}, action.reviews);
    case RECEIVE_REVIEW:
      return Object.assign({}, state, {
        [action.review.id]: action.review,
      });
    default:
      return state;
  }
};

export default reviewsReducer;