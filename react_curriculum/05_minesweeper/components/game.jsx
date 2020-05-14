import React from 'react'; 
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component { 
  constructor() { 
    super(); 
    const board = Minesweeper.board.new(10, 6); 
    this.state = { board };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {}

  render() {
    return (
      <div>
        <Board board={this.state.board} update={this.updateGame}/>
      </div>
    )
  }
}