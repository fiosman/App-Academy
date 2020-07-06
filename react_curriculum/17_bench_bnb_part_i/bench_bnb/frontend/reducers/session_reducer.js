import {
  RECEIVE_CURRENT_USER,
  LOGOUT_CURRENT_USER,
} from "../actions/session_actions";

const _defaultState = {
  id: null,
};

const sessionReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, { id: action.currentUser.id });
    case LOGOUT_CURRENT_USER:
      return _defaultState;
    default:
      return state;
  }
};

export default sessionReducer;