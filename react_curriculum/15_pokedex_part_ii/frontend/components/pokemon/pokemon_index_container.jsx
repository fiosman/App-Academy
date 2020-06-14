import { connect } from "react-redux";
import PokemonIndex from "./pokemon_index.jsx";
import { selectAllPokemon } from "../../reducers/selectors";
import { requestAllPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state) => ({
  pokemon: selectAllPokemon(state),
});

const mapDispatchToProps = (dispatch) => ({
  requestAllPokemon: () => dispatch(requestAllPokemon()),
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);
