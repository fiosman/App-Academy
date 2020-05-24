import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";

const addLoggingToDispatch = (store) => (next) => (action) => {
  console.log(action);
  console.log(store.getState());
  const res = next(action);
  console.log(store.getState());

  return res;
};

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};

document.addEventListener("DOMContentLoaded", () => {
  const preloadedState = localStorage.state
    ? JSON.parse(localStorage.state)
    : {};
  let store = configureStore(preloadedState);
  store = applyMiddlewares(store, addLoggingToDispatch);
  const root = document.getElementById("content");
  ReactDOM.render(<Root store={store} />, root);
});
