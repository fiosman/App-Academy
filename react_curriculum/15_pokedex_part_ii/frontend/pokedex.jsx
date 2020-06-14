import React from "react";
import ReactDOM from "react-dom";
import { configureStore } from "./store/store";
import Root from "./components/root";
import { fetchPokemon } from './util/api_util'; 

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.store = store; 
  window.fetchPoke = fetchPokemon;
  ReactDOM.render(<Root store={store} />, root);
});
