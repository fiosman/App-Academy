class Board {
  constructor() {
    this.board = Board.makeGrid();
  }

  placeMark(pos, mark) { 
    const [row, col] = pos; 

    if (!this.empty(pos)) { 
      console.log('Invalid position!');
    } else { 
      this.board[row][col] = mark;
    }
  }

  empty(pos) { 
    const [row, col] = pos; 
    return this.board[row][col] === null; 
  }

  winner() { 
    //check horizontal win 
    for (let row = 0; row < 3; row++) { 
      if (this.board[row][0] === this.board[row][1] && 
        this.board[row][1] === this.board[row][2]) { 
          return this.board[row][0];
        }
      }
    //check vertical win 
    for (let col = 0; col < 2; col++) { 
      if (this.board[0][col] === this.board[1][col] && 
        this.board[1][col] === this.board[2][col])
        return this.board[0][col]; 
    }
    //check diagonal win 
    if ((this.board[0][0] === this.board[1][1] && 
      this.board[2][2] === this.board[0][0]) || 
      (this.board[2][0] === this.board[1][1] && 
      this.board[0][2] === this.board[2][0])) { 
        return this.board[0][0];
      }

      return null;
  }

  isOver() { 
    if (this.winner()) { 
      return true; 
    }

    for (let row = 0; row < 3; row++) { 
      for (let col = 0; col < 3; col++) { 
        if (this.grid[row][col].empty()) { 
          return false;
        }
      }
    }

    return true;
  }

  printGrid() {
    this.board.forEach(function(row) {
      console.log(row.join("   "));
    });
  }

  static makeGrid() {
    let grid = [];
    for (let i = 0; i < 3; i++) {
      grid.push([]);
      for (let j = 0; j < 3; j++) {
        grid[i].push("*");
      }
    }
    return grid;
  }
}

board = new Board();
board.printGrid();
board.placeMark([1,2], 'X');
board.printGrid();
