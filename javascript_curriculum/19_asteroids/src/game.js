const Asteroid = require("./asteroid.js"); 
const MovingObject = require("./moving_object.js");

function Game() { 
  this.asteroids = []; 
  
  this.addAsteroids(); 
}

Game.DIM_X = 1200;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 50;

Game.prototype.addAsteroids = function() { 
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) { 
    this.asteroids.push(new Asteroid({pos: this.randomPosition()})); 
  }
}

Game.prototype.randomPosition = function() { 
  return [
    Math.floor(Math.random() * Game.DIM_X), 
    Math.floor(Math.random() * Game.DIM_Y)
  ];
}

Game.prototype.draw = function(ctx) { 
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y); 
  this.asteroids.forEach(function(asteroid) { 
    asteroid.draw(ctx); 
  }); 
}

Game.prototype.moveObjects = function() { 
  this.asteroids.forEach(function(asteroid) { 
    asteroid.move(); 
  }); 
}

Game.prototype.wrap = function(pos) { 
}

module.exports = Game;


