import React from 'react'; 
import ReactDOM from 'react-dom'; 
import configureStore from './store/store';
import {receiveTodo, receiveTodos} from './actions/todo_actions';
import Root from './components/root'
import allTodos from './reducers/selectors';

function ToDos() { 
  return ( 
    <h1>ToDos App</h1>
  )
}

document.addEventListener("DOMContentLoaded", () => { 
  const root = document.getElementById("content"); 
  let store = configureStore(); 
  window.store = store;
  window.receiveTodo = receiveTodo; 
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
  ReactDOM.render(<Root store={store}/>, root); 
})