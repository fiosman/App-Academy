class Snake {
  constructor(position) {
    this.direction = "S";
    this.position = position;
    this.segments = [this.position];
  }

  move() {
    switch (this.direction) {
      case "N":
        const nPos = [this.position[0], this.position[1] - 1]; 
        this.segments.push(nPos);
        this.position = nPos
        break;
      case "S":
        const sPos = [this.position[0], this.position[1] + 1];
        this.segments.push(sPos);
        this.position = sPos;
        break;
      case "E":
        const ePos = [this.position[0] + 1, this.position[1]]; 
        this.segments.push(ePos); 
        this.position = ePos; 
        break;
      case "W":
        const wPos = [this.position[0] - 1, this.position[1]]; 
        this.segments.push(wPos);
        this.position = wPos
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

let snake = new Snake([1,1]);
// let newSnake = new Snake([2,3])

snake.move() //[[1,1], [1,2]]
snake.turn("N")
snake.move(); // [[1,1], [1,2], [1,1]]
snake.turn("W")
snake.move(); // [[1,1], [1,2], [1,1], [0, 1]]
snake.turn("N") 
snake.move(); // [[1,1], [1,2], [1,1], [0, 1], [0, 0]]
snake.turn("E") 
snake.move() // [[1,1], [1,2], [1,1], [0, 1], [0, 0], [1, 0]]
console.log(snake.segments)
// snake.turn("W"); 
// snake.move();
// console.log(snake.position);

module.exports = Snake;



