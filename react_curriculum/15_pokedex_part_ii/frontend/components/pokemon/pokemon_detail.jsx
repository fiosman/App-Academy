import React from "react";
import Item from '../items/item'
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
    const items = this.props.items
    console.log(items);
    return (
      <section>
        <ul>
          <li>{pokemon.name}</li>
          <li>Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Moves: {pokemon.moves.join(", ")} </li>
          </ul>
            {/* <section>
        <h2>Items:</h2>
        <ul>
            {pokemon.items.map(item => (
              <Item key={item.name} item={item} />
            ))}
          </ul>
          </section> */}
      </section>
    );
  }
}

export default PokemonDetail;
