import { combineReducers } from 'redux';
import chirpsReducer from './chirps';

export default combineReducers({
  chirps: chirpsReducer,
});
