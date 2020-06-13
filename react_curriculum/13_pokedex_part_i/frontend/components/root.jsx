import React from "react";
import { Provider } from "react-redux";

const Root = (props) => {
  return (
    <Provider store={props.store}>
      <div>Hello, world!</div>
    </Provider>
  );
};

export default Root;
