import { connect } from "react-redux";
import PokemonForm from './pokemon_form';
import { createNewPokemon } from '../../actions/pokemon_actions';

const mapDispatchToProps = (dispatch) => ({
  createNewPokemon: (pokemonData) => dispatch(createNewPokemon(pokemonData)),
});

export default connect(null, mapDispatchToProps)(PokemonForm);
