import React from "react";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemon = this.props.pokemon;
    return (
      <ul>
        {pokemon.map((poke) => (
          <li key={poke.id}>
            <span>{poke.name}</span> <img src={poke.image_url} />
          </li>
        ))}
      </ul>
    );
  }
}

export default PokemonIndex;
