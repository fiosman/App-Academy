import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from './components/root';
import { login }  from './actions/session_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  let store; 

  if (window.currentUser) { 
    const preloadedState = { 
      entities: { 
        users: { [window.currentUser.id]: window.currentUser }
      }, 
      session: { 
        id: window.currentUser.id
      }
    }
    store = configureStore(preloadedState);
    delete window.currentUser; 
  } else { 
    store = configureStore();
  }
  // window.login = login;
  // window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store} />, root);
});
