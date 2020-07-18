import { connect } from 'react-redux';
import BenchForm from './bench_form'; 

const mapStateToProps = (state, ownProps) => ({ 
  lat: new URLSearchParams(ownProps.location.search).get('lat'), 
  lng: new URLSearchParams(ownProps.location.search).get('lng')
})

const mapDispatchToProps = (dispatch) => ({ 

})

export default connect(mapStateToProps, mapDispatchToProps)(BenchForm)
