import React from "react";
import { withRouter } from "react-router-dom";

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      attack: "",
      defense: "",
      moves: [],
      poke_type: "",
      image_url: "",
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInput = this.handleInput.bind(this);
    this.handleMoves = this.handleMoves.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props
      .createNewPokemon(this.state)
      .then((res) => this.props.history.push(`/pokemon/${res.pokemon.id}`));
  }

  handleInput(e) {
    const currentField = e.target.name;
    return this.setState({ [currentField]: e.target.value });
  }

  handleMoves(e) {
    let currMoves = this.state.moves.slice(0);
    const currPos = e.target.name === "move1" ? 0 : 1;
    currMoves[currPos] = e.target.value;
    return this.setState({ moves: currMoves });
  }

  errors() {
    if (this.props.errors.length > 0) {
      return this.props.errors.map((error, index) => {
        return <li key={index}>{error}</li>;
      });
    }
  }

  render() {
    return (
      <section className="pokemon-details">
        <form className="pokemon-form" onSubmit={this.handleSubmit}>
          <img className="logo" src={window.images.pokeLogo}></img>
          <ul>{this.errors()}</ul>
          <input
            type="text"
            name="name"
            placeholder="Name"
            value={this.state.name}
            onChange={this.handleInput}
          ></input>
          <input
            type="text"
            name="image_url"
            placeholder="Image URL"
            value={this.state.image_url}
            onChange={this.handleInput}
          ></input>
          <select
            placeholder="Pokemon Type"
            value={this.state.poke_type}
            onChange={this.handleInput}
            name="poke_type"
          >
            {window.POKEMON_TYPES.map((type, idx) => {
              return <option key={idx} value={type}>{type}</option>;
            })}
          </select>
          <input
            type="number"
            min="1"
            max="100"
            placeholder="Attack"
            name="attack"
            value={this.state.attack}
            onChange={this.handleInput}
          ></input>
          <input
            type="number"
            min="1"
            max="100"
            placeholder="Defense"
            name="defense"
            value={this.state.defense}
            onChange={this.handleInput}
          ></input>
          <input
            type="text"
            placeholder="Move 1"
            value={this.state.moves[0] || ""}
            onChange={this.handleMoves}
            name="move1"
          ></input>
          <input
            type="text"
            placeholder="Move 2"
            value={this.state.moves[1] || ""}
            onChange={this.handleMoves}
            name="move2"
          ></input>
          <button>Create Pokemon</button>
        </form>
      </section>
    );
  }
}

export default withRouter(PokemonForm);
