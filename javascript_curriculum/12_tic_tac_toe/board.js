class Board { 
  constructor() { 
    this.board = Board.makeGrid();
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

  printGrid() { 
    this.board.forEach(function(row) { 
      console.log(row.join("   "));
    })
  }

}

board = new Board(); 
board.printGrid();