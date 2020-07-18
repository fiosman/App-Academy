import { connect } from 'react-redux';
import BenchForm from './bench_form'; 
import { makeBench } from '../../actions/bench_actions';

const mapStateToProps = (state, ownProps) => ({ 
  lat: new URLSearchParams(ownProps.location.search).get('lat'), 
  lng: new URLSearchParams(ownProps.location.search).get('lng')
})

const mapDispatchToProps = (dispatch) => ({ 
  createBench: (bench) => dispatch(makeBench(bench)),
})

export default connect(mapStateToProps, mapDispatchToProps)(BenchForm)
