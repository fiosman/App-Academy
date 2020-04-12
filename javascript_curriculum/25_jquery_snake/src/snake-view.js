const Board = require('./board.js'); 
const Snake = require('./snake.js'); 

class SnakeView { 
  constructor($gameArea) { 
    this.$gameArea = $gameArea; 
    this.board = new Board(20); 
    this.setUpGrid(this.$gameArea); 
    this.handleMove()
  }
  
  setUpGrid($gameArea) { 
    for (let rowIdx = 0; rowIdx < this.board.gridSize; rowIdx++) { 
      const $tr = $("<tr>");
      $gameArea.append($tr); 
      for (let colIdx = 0; colIdx < this.board.gridSize; colIdx++) { 
        const $td = $("<td>");
        $td.data("cell-pos", [rowIdx, colIdx]);
        $tr.append($td);
      }
    }
    
  }

  findEle(val) { 
    $("td").filter(function() { 
      let cellpos = $(this).data('cell-pos');
      return JSON.stringify(cellpos) === JSON.stringify(val);
    })
  }

  handleMove() { 
    $(this.$gameArea).on("click", "td", function() { 
      console.log($(this).data("cell-pos"));
    }) 
  }

}

module.exports = SnakeView;