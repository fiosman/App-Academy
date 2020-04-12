class Snake {
  constructor(position) {
    this.direction = "N";
    this.segments = []; 
    this.position = position;
  }

  move() { 
    switch(this.direction) { 
      case "N": 
        this.position[1] -= 1 
        break
      case "S": 
        this.position[1] += 1;
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

module.exports = Snake;
