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

  drawObjects() { 
    if (this.board.isValidPos(this.board.snake.position)) { 
      this.board.snake.move();
      $("td.snake").removeClass("snake");
      console.log(this.board.snake.segments)
      const newSnake = this.findEle(this.board.snake.position);
      newSnake.addClass("snake");
      if (this.board.apple.collidedWithSnake(this.board.snake.position)) { 
        let segmentPos = this.board.apple.position;
        this.board.snake.growSnake(segmentPos);
        $("td.apple").removeClass().addClass("snake-segment");
        this.board.apple = this.board.generateApple();
        const newApple = this.findEle(this.board.apple.position); 
        newApple.addClass("apple");
      }
    } else { 
      alert("you lose");
    }
  }

  moveHandler() { 
    const snake = this.board.snake; 
    let self = this;
    $(document).keydown(function(e) { 
      switch (e.which) {
        case 37:
          snake.turn("W")
          self.drawObjects();
          break; 
        case 39: 
          snake.turn("E");
          self.drawObjects();
          break;
        case 40:
          snake.turn("S"); 
          self.drawObjects();
          break; 
        case 38:
          snake.turn("N"); 
          self.drawObjects();
          break; 
      }
    })
  }
}

module.exports = SnakeView;