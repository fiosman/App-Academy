import { combineReducers } from "redux";
import usersReducer from "./users_reducer";

const entitiesReducer = combineReducers({
  user: usersReducer,
});

export default entitiesReducer;