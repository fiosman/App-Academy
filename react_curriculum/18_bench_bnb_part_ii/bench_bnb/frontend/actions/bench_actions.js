import { fetchBenches } from "../util/bench_api_util";
export const RECEIVE_BENCHES = 'RECEIVE_BENCHES'; 
//regular action creators
export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches,
});

//async action creators

export const getBenches = () => (dispatch) =>
  fetchBenches().then((benches) => dispatch(receiveBenches(benches)));
