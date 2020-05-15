import React from 'react'; 
import * as Minesweeper from '../minesweeper';
import Board from './board';
import Tile from "./tile"

export default class Game extends React.Component { 
  constructor() { 
    super(); 
    const board = new Minesweeper.Board(10, 6); 
    this.state = { board };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {}

  render() {
    return (
      <div>
        {/* <Tile/> */}
        <Board board={this.state.board} update={this.updateGame}/>
      </div>
    )
  }
}