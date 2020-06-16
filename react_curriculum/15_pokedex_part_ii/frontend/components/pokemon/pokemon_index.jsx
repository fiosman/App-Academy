import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
import { Route } from "react-router-dom";
import PokemonDetailContainer from "./pokemon_detail_container";
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
      <section>
        <ul>{items}</ul>
        <section>
          <Route
            path={"/pokemon/:pokemonId"}
            component={PokemonDetailContainer}
          />
        </section>
      </section>
    );
  }
}

export default PokemonIndex;
