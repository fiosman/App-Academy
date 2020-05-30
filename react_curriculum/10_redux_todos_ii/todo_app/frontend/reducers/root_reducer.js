import { combineReducers } from "redux";
import todosReducer from "./todos_reducer";
import stepsReducer from "./steps_reducer";
import errorReducer from "./error_reducer"; 

const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer,
  errors: errorReducer,
});

export default rootReducer;
