import { connect } from 'react-redux'; 
import { loginUser } from '../../actions/session'; 
import Login from './login'; 

const mapDispatchToProps = (dispatch) => ({ 
  loginUser: (formUser) => dispatch(loginUser(formUser))
})

export default connect(null, mapDispatchToProps)(Login); 