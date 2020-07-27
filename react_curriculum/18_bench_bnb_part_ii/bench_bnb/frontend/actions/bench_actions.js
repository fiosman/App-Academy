import { fetchBenches } from "../util/bench_api_util";
import { createBench } from "../util/bench_api_util";
import { fetchBench } from "../util/bench_api_util";
import { createReview } from "../util/bench_api_util";
export const RECEIVE_REVIEW = "RECEIVE_REVIEW";
export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";

//regular action creators
export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches,
});

export const receiveBench = (bench) => ({
  type: RECEIVE_BENCH,
  bench,
  reviews: bench.reviews, 
  average_rating: bench.average_rating
});

export const receiveReview = (review) => ({
  type: RECEIVE_REVIEW,
  review,
  average_rating: review.average_rating, 
  author: review.author
});

//async action creators
export const getBenches = (filters) => (dispatch) =>
  fetchBenches(filters).then((benches) => dispatch(receiveBenches(benches)));

export const getBench = (benchId) => (dispatch) =>
  fetchBench(benchId).then((bench) => dispatch(receiveBench(bench)));

export const makeBench = (bench) => (dispatch) =>
  createBench(bench).then((bench) => dispatch(receiveBench(bench)));

export const postReview = (review) => (dispatch) =>
  createReview(review).then((review) =>
    dispatch(receiveReview(review))
  );
