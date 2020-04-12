const Board = require('./board.js'); 
const Snake = require('./snake.js'); 

class SnakeView { 
  constructor($gameArea) { 
    this.$gameArea = $gameArea; 
    this.board = new Board(20); 
    this.setUpGrid(this.$gameArea); 
    this.moveHandler()
  }
  
  setUpGrid($gameArea) { 
    for (let yPos = 0; yPos < this.board.gridSize; yPos++) { 
      const $tr = $("<tr>");
      $gameArea.append($tr); 
      for (let xPos = 0; xPos < this.board.gridSize; xPos++) { 
        const $td = $("<td>");
        $td.data("cell-pos", [xPos, yPos]);
        $tr.append($td);
      }
    }
    const initialSnakePos = this.board.snake.position; 
    const initialApplePos = this.board.apple.position; 

    this.findEle(initialSnakePos).addClass("snake");
    this.findEle(initialApplePos).addClass("apple");
  }

  findEle(val) { 
    return $("td").filter(function() { 
      let cellpos = $(this).data('cell-pos');
      return JSON.stringify(cellpos) === JSON.stringify(val);
    })
  }

  drawSnake() { 
    const snake = this.board.snake;
    if (this.board.isValidPos(snake.position)) { 
      snake.move();
      $("td.snake").removeClass("snake");
      const newSnake = this.findEle(snake.position);
      newSnake.addClass("snake");
    } else { 
      alert('You lose');
    }
  }

  moveHandler() { 
    const snake = this.board.snake; 
    let self = this;
    $(document).keydown(function(e) { 
      switch (e.which) {
        case 37:
          snake.turn("W")
          self.drawSnake();
          break; 
        case 39: 
          snake.turn("E");
          self.drawSnake();
          break;
        case 40:
          snake.turn("S"); 
          self.drawSnake();
          break; 
        case 38:
          snake.turn("N"); 
          self.drawSnake();
          break; 
      }
    })
  }
}

module.exports = SnakeView;