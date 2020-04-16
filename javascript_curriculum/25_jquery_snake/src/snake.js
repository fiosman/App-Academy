class Snake {
  constructor(position) {
    this.direction = "S";
    this.position = position;
    this.segments = [this.position];
  }

  move() {
    switch (this.direction) {
      case "N":
        this.position[1] -= 1
        break;
      case "S":
        this.position[1] += 1;
        break;
      case "E":
        this.position[0] += 1; 
        break;
      case "W":
        this.position[0] -= 1;
        break;
    }
  }

  turn(direction) {
    this.direction = direction;
  }

  growSnake(snakePos) {
    this.segments.push(snakePos);
  }

  head() { 
    return this.segments[0]; 
  }
}

  module.exports = Snake;