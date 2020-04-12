const Snake = require('./snake.js');
const Apple = require('./apple.js'); 
class Board { 
  constructor(gridSize) { 
    this.gridSize = gridSize;
    this.snake = new Snake([
      Math.floor(this.gridSize/2), 
      Math.floor(this.gridSize/2)
    ]);
    this.apple = this.generateApple(); 
  }

  isValidPos(pos) { 
    const [x,y] = pos; 
    return ((x > -1 && x < this.gridSize) && (y > -1 && y < this.gridSize)); 
  }

  isOccupiedBySnake(pos) { 
    return this.snake.position === pos;
  }

  generateApple() { 
    const potentialApplePos = [ 
      Math.floor(Math.random() * this.gridSize), 
      Math.floor(Math.random() * this.gridSize)
     ]; 
     
     if (!this.isOccupiedBySnake(potentialApplePos)) { 
       return new Apple(potentialApplePos); 
      } else { 
        this.generateApple(); 
      }
    }
  }

module.exports = Board