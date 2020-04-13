class Apple { 
  constructor(position) { 
    this.position = position; 
  }
  
  collidedWithSnake(snakePos) { 
    return JSON.stringify(snakePos) === JSON.stringify(this.position);
  }
}

module.exports = Apple;