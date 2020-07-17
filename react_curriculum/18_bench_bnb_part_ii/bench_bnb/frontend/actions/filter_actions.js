export const UPDATE_BOUNDS = "UPDATE_BOUNDS";
import { getBenches } from './bench_actions';

export const changeFilter = (filter, value) => ({
  type: UPDATE_BOUNDS,
  filter, 
  value, 
});

export const updateFilter = (filter, value) => (dispatch, getState) => {
  dispatch(changeFilter(filter, value));
  return getBenches(getState().ui.filters)(dispatch);
};
