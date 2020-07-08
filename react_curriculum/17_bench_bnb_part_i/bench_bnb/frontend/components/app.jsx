import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from "./session_form/login_form_container";
import SignUpFormContainer from "./session_form/signup_form_container";
import { Route } from "react-router-dom";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <Route path="/" exact component={GreetingContainer} />
    </header>
    <Route path="/login" exact component={LoginFormContainer} />
    <Route path="/signup" exact component={SignUpFormContainer} />
  </div>
);

export default App;
