import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

const addLoggingToDispatch = (store) => { 
  const storeDispatch = store.dispatch; 

  return function(action) { 
    console.log(store.getState()); 
    console.log(action); 
    storeDispatch(action); 
    console.log(store.getState()); 
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  store.dispatch = addLoggingToDispatch(store)
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
