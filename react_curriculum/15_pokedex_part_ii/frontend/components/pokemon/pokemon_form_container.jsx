import { connect } from "react-redux";
import PokemonForm from './pokemon_form';

const mapDispatchToProps = (dispatch) => ({
  createPokemon: (pokemonData) => dispatch(createNewPokemon(pokemonData)),
});

export default connect(null, mapDispatchToProps)(PokemonForm);
