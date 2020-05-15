import React from "react";
import * as Minesweeper from "../minesweeper";
import Board from "./board";

export default class Game extends React.Component {
  constructor() {
    super();
    const board = new Minesweeper.Board(9, 10);
    this.state = { board };
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, isFlagged) {
    if (isFlagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }

  restartGame() {
    const board = new Minesweeper.Board(9, 10);
    this.setState({ board: board });
  }

  render() {
    let modal;
    if (this.state.board.lost() || this.state.board.won()) {
      const text = this.state.board.won() ? "You won!" : "You lost!";
      modal = (
        <div className="modal-screen">
          <div className="modal-content">
            <p>{text}</p>
            <button onClick={this.restartGame}>Play Again</button>
          </div>
        </div>
      );
    }

    return (
      <div className="game-area">
        {modal}
        <Board board={this.state.board} update={this.updateGame} />
      </div>
    );
  }
}
