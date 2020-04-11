class Snake {
  constructor(position) {
    this.direction = DIRS[0];
    this.segments = []; 
    this.position = position;
  }

  move() { 
    switch(this.direction) { 
      case "N": 
        this.position[1] += 1 
        break
      case "S": 
        this.position[1] -= 1;
        break
      case "E": 
        this.position[0] += 1; 
        break
      case "W": 
        this.position[0] -= 1; 
        break
    }; 
  }

  turn(direction) { 
    this.direction = direction; 
  }

}

const DIRS = ["N", "S", "E", "W"]

module.exports = Snake;
