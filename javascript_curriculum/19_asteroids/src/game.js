const Asteroid = require("./asteroid.js"); 
const MovingObject = require("./moving_object.js");

function Game() { 
  this.asteroids = addAsteroids(); 
}

Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 50;

Game.prototype.addAsteroids = function() {
  let asteroids = [];  

  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) { 
    asteroids.push(new Asteroid({pos: this.randomPosition()})); 
  }
}

Game.prototype.randomPosition = function() { 
  return [
    Math.floor(Math.random() * Game.DIM_X), 
    Math.floor(Math.random() * Game.DIM_Y)
  ];
}

Game.prototype.draw = function(ctx) { 
}

Game.prototype.moveObjects = function() { 
}
