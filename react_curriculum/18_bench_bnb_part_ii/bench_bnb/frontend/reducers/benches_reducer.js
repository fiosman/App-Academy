import { RECEIVE_BENCHES } from "../actions/bench_actions";
import { RECEIVE_BENCH } from '../actions/bench_actions'; 
import { RECEIVE_REVIEW } from '../actions/bench_actions';

const benchesReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_BENCHES:
      return action.benches;
    case RECEIVE_BENCH: 
      return Object.assign({}, state, { [action.bench.id]: action.bench})
    case RECEIVE_REVIEW: 
      const review = action.review; 
      const newState = Object.assign({}, state); 
      newState[review.bench_id].average_rating = action.average_rating;
      return newState;
    default:
      return state;
  }
};

export default benchesReducer;
