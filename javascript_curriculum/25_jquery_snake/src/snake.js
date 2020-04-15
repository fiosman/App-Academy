class Snake {
  constructor(position) {
    this.direction = "N";
    this.segments = [this];
    this.position = position;
  }

  move() {
    switch (this.direction) {
      case "N":
        this.position[1] -= 1;
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

  growSnake(segment) {
    this.segments.push(segment);
  }

  head() { 
    return this.segments[0]; 
  }

}

let snake = new Snake([1,1]);
let newSnake = new Snake([2,3])

snake.growSnake(newSnake);
console.log(snake.segments)
console.log(snake.head())

module.exports = Snake;



