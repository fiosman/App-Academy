import { combineReducers } from 'redux'; 
import errorsReducer from './errors_reducer';
import loadingReducer from './loading_reducer'

const uiReducer = combineReducers({ 
  errors: errorsReducer, 
  loading: loadingReducer
})

export default uiReducer;