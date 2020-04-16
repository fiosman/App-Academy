const Board = require("./board.js");
const Snake = require("./snake.js");

class SnakeView {
  constructor($gameArea) {
    this.$gameArea = $gameArea;
    this.board = new Board(20);
    this.setUpGrid(this.$gameArea);
    this.moveHandler();
    this.timer = null;
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
    return $("td").filter(function () {
      let cellpos = $(this).data("cell-pos");
      return JSON.stringify(cellpos) === JSON.stringify(val);
    });
  }

  drawObjects() {
    if (this.board.isValidPos(this.board.snake.position)) {
      this.board.snake.move();
      $("td.snake").removeClass("snake");
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

  animateSnake() { 
    let self = this;
    this.timer = setInterval(function() { 
      self.drawObjects(); 
    }, 1000)
  }

  moveHandler() {
    const snake = this.board.snake;
    let self = this;
    $(document).keydown(function (e) {
      switch (e.which) {
        case 37: //left
          if (snake.direction === "E" || snake.direction === "W") {
            clearInterval(self.timer)
            self.timer = self.animateSnake();
          } else {
            snake.turn("W");
            clearInterval(self.timer)
            self.timer = self.animateSnake();
          }
          break;
        case 39: //right
          if (snake.direction === "E" || snake.direction === "W") { 
            clearInterval(self.timer)
            self.timer = self.animateSnake();
          } else {
            clearInterval(self.timer)
            snake.turn("E");
            self.timer = self.animateSnake();
          }
          break;
        case 40: //down arrow
          if (snake.direction === "S" || snake.direction === "N") {
            clearInterval(self.timer)
            self.animateSnake();
          } else {
            clearInterval(self.timer)
            snake.turn("S");
            self.timer = self.animateSnake();
          }
          break;
        case 38: //up arrow
          if (snake.direction === "S" || snake.direction === "N") {
            clearInterval(self.timer)
            self.timer = self.animateSnake();
          } else {
            clearInterval(self.timer)
            snake.turn("N");
            self.timer = self.animateSnake();
          }
          break
      }
    });
  }
}

module.exports = SnakeView;
