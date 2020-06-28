import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
import { Route } from "react-router-dom";
import PokemonDetailContainer from "./pokemon_detail_container";
import PokemonFormContainer from "./pokemon_form_container";
import Loader from "../loader";
class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemon = this.props.pokemon;

    if (this.props.loading) {
      return <Loader />;
    }
    
    const items = pokemon.map((poke) => (
      <PokemonIndexItem key={poke.id} poke={poke} />
    ));
    return (
      <div className="container">
        <ul className="pokemon-view">{items}</ul>
        <section>
          <Route
            path="/pokemon/:pokemonId"
            component={PokemonDetailContainer}
          />
          <Route exact path="" component={PokemonFormContainer} />
        </section>
      </div>
    );
  }
}

export default PokemonIndex;
