import React from 'react';
import WelcomeBar from './nav_bar/welcome_bar_container';
import NavBarContainer from './nav_bar/nav_bar_container';
import ChirpIndexContainer from './chirps/chirp_index_container';
import Home from './home/home';
import { Route } from 'react-router-dom';
import SignUpContainer from './session/signup_container'; 

export default () => (
  <div>
    <Route path="/" component={NavBarContainer} />
    <Route exact path="/" component={Home} />
    <Route path="/chirps" component={ChirpIndexContainer} />
    <Route path="/signup" component={SignUpContainer} />
  </div>
);
