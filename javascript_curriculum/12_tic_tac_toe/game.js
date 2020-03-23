const Board = require('./board')

class Game { 
  constructor() { 
   this.currentPlayer = 'X'; 
   this.board = new Board();
  }

  run(reader, completionCallback) {
    this.promptMove(reader, move => { 
      this.playMove(move); 

      if (this.gameOver()) { 
        this.board.printGrid(); 
        if (this.board.winner()) { 
          this.announceWinner(); 
        } else { 
          console.log('It is a draw'); 
        }
        completionCallback(); 
      } else { 
        this.run(reader, completionCallback);
      }
    });
  }

  announceWinner() { 
    return `The winner of this game is ${this.board.winner()}`;
  }

  promptMove(reader, callback) { 
    this.board.printGrid(); 
    console.log(`Current turn is ${this.currentPlayer}`);

    reader.question('Please enter a row index (0,1,2):', rowAns => { 
      const rowIdx = parseInt(rowAns); 
      reader.question('Please etner a column index (0,1,2):', colAns => { 
        const colIdx = parseInt(colAns); 
        callback([rowIdx, colIdx]); 
        }); 
    }); 
  }

  swapTurn() { 
    this.currentPlayer === 'X' ? this.currentPlayer = 'O' : this.currentPlayer = 'X';
  }

  playMove(pos) { 
    this.board.placeMark(pos, this.currentPlayer); 
    this.swapTurn();
  }

  gameOver() { 
    return this.board.isOver();
  }
}

module.exports = Game;