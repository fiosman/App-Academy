export const UPDATE_BOUNDS = "UPDATE_BOUNDS";
import { getBenches } from './bench_actions';

export const updateBounds = (bounds) => ({
  type: UPDATE_BOUNDS,
  bounds,
});

export const changeBounds = (filter) => (dispatch, getState) => {
  dispatch(updateBounds(filter));
  return getBenches(getState().filters)(dispatch);
};
