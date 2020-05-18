import React from 'react'; 
import ReactDOM from 'react-dom'; 
import configureStore from './store/store';

function ToDos() { 
  return ( 
    <h1>ToDos App</h1>
  )
}

document.addEventListener("DOMContentLoaded", () => { 
  const root = document.getElementById("content"); 
  let store = configureStore(); 
  window.store = store;
  ReactDOM.render(<ToDos/>, root); 
})
