const Board = require('./board')

class Game { 
  constructor(reader) { 
   this.reader = reader; 
   this.currentPlayer = 'X'; 
   this.board = new Board();
  }

  run(reader, completionCallback) {

  }

  announceWinner() { 
    return `The winner of this game is ${this.board.winner()}`;
  }

  promptMove() { 

  }

  swapTurns() { 
    this.currentPlayer === 'X' ? this.currentPlayer = 'O' : this.currentPlayer = 'X';
  }

  playMove(pos) { 

  }

  gameOver() { 
    return this.board.isOver();
  }
}

module.exports = Game;