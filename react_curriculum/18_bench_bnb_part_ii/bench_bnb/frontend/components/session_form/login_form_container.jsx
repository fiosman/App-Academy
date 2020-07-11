import { connect } from "react-redux";
import SessionForm from "./session_form";
import { login } from "../../actions/session_actions";
import { Link } from 'react-router-dom';
import React from 'react';

const mapStateToProps = (state) => ({
  formType: "login",
  errors: state.errors.session,
  navLink: <Link to="/signup">Sign up</Link>,
});

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(login(user)),
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
