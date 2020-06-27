import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
import { Route } from "react-router-dom";
import PokemonDetailContainer from "./pokemon_detail_container";
import PokemonFormContainer from "./pokemon_form_container";
class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemon = this.props.pokemon;
    const items = pokemon.map((poke) => (
      <PokemonIndexItem key={poke.id} poke={poke} />
    ));
    return (
      <div className="container">
        <section className="pokemon-view">
          <ul>{items}</ul>
        </section>
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
