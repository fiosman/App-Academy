import { connect } from 'react-redux'; 
import PokemonIndex from './pokemon_index.jsx'; 
import { selectAllPokemon } from '../../reducers/selectors'; 

const mapStateToProps = (state) => ({ 
  pokemon: selectAllPokemon(state)
})

const mapDispatchToProps = (dispatch) => ({ 
  requestAllPokemon: dispatch(requestAllPokemon)
})

export default connect( 
  mapStateToProps, 
  mapDispatchToProps
)(PokemonIndex); 