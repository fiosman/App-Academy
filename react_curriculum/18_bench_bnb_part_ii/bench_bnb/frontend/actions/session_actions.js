import { signupUser, loginUser, logoutUser } from "../util/session_api_util";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

// regular action creators
export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser,
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors,
});

// thunk action creators
export const signup = (user) => (dispatch) => {
  return signupUser(user).then(
    (user) => dispatch(receiveCurrentUser(user)),
    (err) => dispatch(receiveErrors(err.responseJSON))
  );
};

export const login = (user) => (dispatch) => {
  return loginUser(user).then(
    (user) => dispatch(receiveCurrentUser(user)),
    (err) => dispatch(receiveErrors(err.responseJSON))
  );
};

export const logout = () => (dispatch) => {
  return logoutUser().then(
    () => dispatch(logoutCurrentUser()),
    (err) => dispatch(receiveErrors(err.responseJSON))
  );
};
