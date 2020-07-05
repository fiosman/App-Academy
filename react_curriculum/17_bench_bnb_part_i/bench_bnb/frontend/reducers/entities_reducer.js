import { combineReducers } from "redux";
import { usersReducer } from "./users_reducer";

export const entitiesReducer = combineReducers({
  user: usersReducer,
});
