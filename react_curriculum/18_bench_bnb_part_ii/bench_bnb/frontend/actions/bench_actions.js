import { fetchBenches } from "../util/bench_api_util";
export const RECEIVE_BENCHES = 'RECEIVE_BENCHES'; 
export const RECEIVE_BENCH = 'RECEIVE_BENCH';
//regular action creators
export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches,
});

export const receiveBench = (bench) => ({ 
  type: RECEIVE_BENCH, 
  bench,
})
//async action creators

export const getBenches = (filters) => (dispatch) =>
  fetchBenches(filters).then((benches) => dispatch(receiveBenches(benches)));
