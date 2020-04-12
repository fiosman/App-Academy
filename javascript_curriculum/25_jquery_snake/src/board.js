const Snake = require('./snake.js');
const Apple = require('./apple.js'); 
class Board { 
  constructor(gridSize) { 
    this.gridSize = gridSize;
    this.snake = new Snake([
      Math.floor(this.gridSize/2), 
      Math.floor(this.gridSize/2)
    ]);
  }

  isValidPos(pos) { 
    const [x,y] = pos; 
    return ((x > -1 && x < this.gridSize) && (y > -1 && y < this.gridSize)); 
  }

  isOccupiedBySnake(pos) { 
    return this.snake.position === pos;
  }
}

module.exports = Board