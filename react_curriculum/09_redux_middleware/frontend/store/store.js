import { createStore, applyMiddleware } from "redux";
import rootReducer from "../reducers/root_reducer";

const addLoggingToDispatch = (store) => (next) => (action) => {
  console.log(action);
  console.log(store.getState());
  next(action); //hit loggingNext middleware
  console.log(store.getState());
};

const loggingNext = (store) => (next) => (action) => {
  console.log("Action to dispatch from addLoggingToDispatch:", action);
  return next(action); //reducer has been hit
};
const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch, loggingNext)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
