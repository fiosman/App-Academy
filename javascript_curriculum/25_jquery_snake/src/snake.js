class Snake {
  constructor() {
    this.direction = DIRS.R; 
    this.segments = []; 
  }

  move() { 

  }

  turn(direction) { 
    this.direction = direction; 
  }
  
}

const DIRS = { 
  R: [1, 0], 
  L: [-1, 0], 
  U: [0, 1], 
  D: [0, -1]
}; 


module.exports = Snake;
