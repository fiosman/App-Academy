import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
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
      </section>
    );
  }
}

export default PokemonIndex;
