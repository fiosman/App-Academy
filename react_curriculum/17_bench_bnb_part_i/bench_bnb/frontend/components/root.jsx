import React from "react";
import { HashRouter } from "react-router-dom";
import App from "./app";

const Root = (props) => (
  <Provider store={props.store}>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
);

export default Root;
