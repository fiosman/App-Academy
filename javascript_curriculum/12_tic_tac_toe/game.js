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

  }

  promptMove() { 

  }

  swapTurns() { 

  }

  playMove(pos) { 

  }

  gameOver() { 
    return this.board.isOver();
  }
}

module.exports = Game;