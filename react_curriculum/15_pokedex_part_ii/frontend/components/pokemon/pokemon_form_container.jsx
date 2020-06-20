import { connect } from "react-redux";

const mapDispatchToProps = (dispatch) => ({
  createPokemon: (pokemonData) => dispatch(createNewPokemon(pokemonData)),
});

export default connect(null, mapDispatchToProps)(PokemonForm);
