import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';

export const configureStore = () => { 
  return createStore(rootReducer, applyMiddleware(thunk))
}
