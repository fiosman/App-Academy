import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
// import {requestTodos} from './actions/todo_actions'; 
import { fetchSteps } from './actions/step_actions'; 

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  let store = configureStore();
  window.store = store; 
  window.fetchSteps = fetchSteps;
  
  ReactDOM.render(<Root store={store} />, root);
});
