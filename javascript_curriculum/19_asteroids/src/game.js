const Asteroid = require("./asteroid.js"); 
const MovingObject = require("./moving_object.js");

function Game() { 
}

Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 50;

Game.prototype.addAsteroids = function() { 

}

Game.prototype.randomPosition = function() { 
  return [
    Math.floor(Math.random() * Game.DIM_X), 
    Math.floor(Math.random() * Game.DIM_Y)
  ];
}
