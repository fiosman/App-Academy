import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
// import {requestTodos} from './actions/todo_actions'; 

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  let store = configureStore();
  ReactDOM.render(<Root store={store} />, root);
});
