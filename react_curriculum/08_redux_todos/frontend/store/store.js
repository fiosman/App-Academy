import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer";

const configureStore = (preloadedState={}) => {
    const store = createStore(rootReducer, preloadedState);
    store.subscribe(() => {
      localStorage.setItem("state", JSON.stringify(store.getState()));
    });
    return store;
  }

export default configureStore;
