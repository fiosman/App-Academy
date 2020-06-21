import React from "react";

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      attack: '',
      defense: '',
      moves: {},
      poke_type: "",
      image_url: "",
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInput = this.handleInput.bind(this);
    this.handleMoves = this.handleMoves.bind(this);
  }

  handleSubmit() {}

  handleInput(e) {
    const currentField = e.target.name; 
    return this.setState({[currentField]: e.target.value});
  }

  handleMoves(e) {
    const currentField = e.target.name;
    return this.setState({ moves: Object.assign({}, this.state.moves, { 
      [currentField]: e.target.value
    })});
  }

  render() {
    console.log(this.state);
    return (
      <form onSubmit={this.handleSubmit}>
        <h2>Create a Pokemon</h2>
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
          <option value="fire">fire</option>
          <option value="electric">electric</option>
          <option value="normal">normal</option>
          <option value="ghost">ghost</option>
          <option value="psychic">psychic</option>
          <option value="water">water</option>
          <option value="bug">bug</option>
          <option value="dragon">dragon</option>
          <option value="grass">grass</option>
          <option value="fighting">fighting</option>
          <option value="ice">ice</option>
          <option value="flying">flying</option>
          <option value="poison">poison</option>
          <option value="ground">ground</option>
          <option value="rock">rock</option>
          <option value="steel">steel</option>
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
          name="move_1"
          value={this.state.moves.move_1 || ''}
          onChange={this.handleMoves}
        ></input>
        <input
          type="text"
          placeholder="Move 2"
          value={this.state.moves.move_2 || ''}
          name="move_2"
          onChange={this.handleMoves}
        ></input>
        <button>Create Pokemon</button>
      </form>
    );
  }
}

export default PokemonForm;
