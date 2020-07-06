import React from 'react'; 
import ReactDOM from 'react-dom'; 
import configureStore from './store/store';
import { 
  signup,
  login, 
  logout
} from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => { 
  const root = document.getElementById('root'); 
  window.signup = signup; 
  window.login = login; 
  window.logout = logout;
  const store = configureStore();
  window.getState = store.getState; 
  window.dispatch = store.dispatch;
  ReactDOM.render(<h1>Hello there</h1>, root);
})