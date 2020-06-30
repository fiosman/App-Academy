import * as SessionUtil from "../utils/session";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user,
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});

export const createNewUser = (formUser) => (dispatch) =>
  SessionUtil.postUser(formUser).then((user) =>
    dispatch(receiveCurrentUser(user))
  );

export const loginUser = (formUser) => (dispatch) =>
  SessionUtil.postSession(formUser).then((user) =>
    dispatch(receiveCurrentUser(user))
  );

export const logoutUser = () => (dispatch) =>
  SessionUtil.deleteSession().then(() => dispatch(logoutCurrentUser()));
