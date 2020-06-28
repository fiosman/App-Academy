import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import { requestSinglePokemon } from "../../actions/pokemon_actions";
import {selectPokemonItems} from "../../reducers/selectors"

export const mapStateToProps = (state, ownProps) => {
  const pokemon = state.entities.pokemon[ownProps.match.params.pokemonId];
  const items = selectPokemonItems(state, pokemon);

  return {
    pokemon: pokemon,
    items: items,
    loading: state.ui.loading.detail,
  };
};

export const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (pokemonId) =>
    dispatch(requestSinglePokemon(pokemonId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
