import { connect } from "react-redux";
import SessionForm from "./session_form";
import { signup } from "../../actions/session_actions";

const mapStateToProps = (state) => ({
  formType: "signup",
  errors: state.errors.session,
});

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(signup(user)),
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
