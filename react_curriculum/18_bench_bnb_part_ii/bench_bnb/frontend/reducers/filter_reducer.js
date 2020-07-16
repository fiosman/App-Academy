import { UPDATE_BOUNDS } from "../actions/filter_actions";

const _default = { bounds: {} };

const filterReducer = (state, action) => {
  Object.freeze(state);

  switch(action.type) { 
    case UPDATE_BOUNDS: 
      return action.bounds
    default: 
      return _default;
  }
};

export default filterReducer; 
