import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import { requestSinglePokemon } from "../../actions/pokemon_actions";

export const mapStateToProps = (state, ownProps) => ({
  pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
});

export const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (pokemonId) =>
    dispatch(requestSinglePokemon(pokemonId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
