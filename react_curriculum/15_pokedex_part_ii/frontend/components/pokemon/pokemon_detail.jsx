import React from "react";
import Item from "../items/item";
import { Route } from "react-router-dom";
import ItemDetailContainer from "../items/item_detail_container";
import Loader from "../loader";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if (
      prevProps.match.params.pokemonId !== this.props.match.params.pokemonId
    ) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }
  }

  render() {
    const pokemon = this.props.pokemon;
    const items = this.props.items;

    if (this.props.loading) {
      return <Loader />;
    }

    if (!pokemon) return null;

    return (
      <section className="pokemon-details">
        <ul>
          <li>{pokemon.name}</li>
          <li>Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Moves: {pokemon.moves.join(", ")} </li>
        </ul>
        <section className="pokemon-items">
          <h2>Items:</h2>
          <ul>
            {items.map((item) => (
              <Item key={item.name} item={item} />
            ))}
          </ul>
          <Route
            path="/pokemon/:pokemonId/item/:itemId"
            component={ItemDetailContainer}
          />
        </section>
      </section>
    );
  }
}

export default PokemonDetail;
