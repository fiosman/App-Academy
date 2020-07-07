import React from "react";
import { Link } from "react-router-dom";

const Greeting = (props) => {
  let status;
  if (props.currentUser) {
    status = (
      <section>
        <p>Welcome to our app! {props.currentUser.username}</p>
        <button onClick={props.logout}>Log out</button>
      </section>
    );
  } else {
    status = (
      <section>
        <Link to="/signup">Sign up</Link>
        <Link to="/login">Log in</Link>
      </section>
    );
  }
  return <div>{status}</div>;
};

export default Greeting;
