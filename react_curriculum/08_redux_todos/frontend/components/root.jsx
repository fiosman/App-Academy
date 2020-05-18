import React from "react";
import { Provider } from "react-redux";
import App from "./app";

const Root = (props) => (
  <Provider store={props.store}>
    <App />
  </Provider>
);

export default Root;
