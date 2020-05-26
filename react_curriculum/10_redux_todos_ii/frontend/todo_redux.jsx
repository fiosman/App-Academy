import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const parsedStoredState = JSON.parse(localStorage.getItem("state"));
  const storedTodos = parsedStoredState.todos;
  const storedSteps = parsedStoredState.steps;
  let store = configureStore({ todos: storedTodos, steps: storedSteps });
  ReactDOM.render(<Root store={store} />, root);
});
