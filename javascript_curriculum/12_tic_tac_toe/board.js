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
