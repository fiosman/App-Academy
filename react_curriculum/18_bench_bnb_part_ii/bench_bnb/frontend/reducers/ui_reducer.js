import { combineReducers } from "redux";
import filterReducer from "./filter_reducer";

const uiReducer = combineReducers({
  filters: filterReducer,
});

export default uiReducer;
