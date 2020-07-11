import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from "./session_form/login_form_container";
import SignUpFormContainer from "./session_form/signup_form_container";
import { Route } from "react-router-dom";
import { AuthRoute } from '../util/route_util';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <Route path="/" exact component={GreetingContainer} />
    </header>
    <AuthRoute path="/login" exact component={LoginFormContainer} />
    <AuthRoute path="/signup" exact component={SignUpFormContainer} />
  </div>
);

export default App;
