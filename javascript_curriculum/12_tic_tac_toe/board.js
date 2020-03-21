class Board { 
  constructor() { 
    this.board = Board.makeGrid();
  }

  static makeGrid() { 
    let arr = []; 
    for (let i = 0; i < 3; i++) { 
      arr.push([]);
      for (let j = 0; j < 3; j++) { 
        arr[i].push('_'); 
      }
    }
    return arr;
  }

  printGrid() { 
    this.board.forEach(function(ele) { 
      console.log(ele);
    })
  }
}
