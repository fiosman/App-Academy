import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from "./session_form/login_form_container";
import SignUpFormContainer from "./session_form/signup_form_container";
import SearchContainer from "./search/search_container";
import BenchFormContainer from "./bench_form/bench_form_container";
import { Route, Switch } from "react-router-dom";
import { AuthRoute, ProtectedRoute } from "../util/route_util";
import BenchShowContainer from "./bench/bench_show_container";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <Route path="/" exact component={GreetingContainer} />
    </header>
    <Switch>
      <AuthRoute exact path="/login" component={LoginFormContainer} />
      <AuthRoute exact path="/signup" component={SignUpFormContainer} />
      <Route exact path="/" component={SearchContainer} />
      <ProtectedRoute
        exact
        path="/benches/new"
        component={BenchFormContainer}
      />
      <Route path="/benches/:benchId" component={BenchShowContainer} />
    </Switch>
  </div>
);

export default App;
