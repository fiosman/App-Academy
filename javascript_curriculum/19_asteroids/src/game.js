const Asteroid = require("./asteroid.js"); 
const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js"); 

function Game() { 
  this.asteroids = []; 
  this.addAsteroids(); 
  this.ship = new Ship({ 
    pos: this.randomPosition(), 
    game: this
  }); 
}

Game.DIM_X = 1200;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 10;

Game.prototype.addAsteroids = function() { 
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) { 
    this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this})); 
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
  this.allObjects().forEach(function(object) { 
    object.draw(ctx); 
  }); 
}

Game.prototype.moveObjects = function() { 
  this.allObjects().forEach(function(object) { 
    object.move(); 
  }); 
}

Game.prototype.wrap = function(pos) { 
  let [posX, posY] = pos; 

  if (posX < 0) { 
    posX = Game.DIM_X; 
  } else if (posX > Game.DIM_X) { 
    posX = 0; 
  }

  if (posY < 0) { 
    posY = Game.DIM_Y; 
  } else if (posY > Game.DIM_Y) { 
    posY = 0; 
  }

  return [posX, posY]; 
}

Game.prototype.checkCollisions = function() { 
  for (let i = 0; i < this.allObjects().length; i++) { 
    for (let j = i + 1; j < this.allObjects().length; j++) { 
      const firstObj = this.allObjects()[i]; 
      const secondObj = this.allObjects()[j]; 
      if (firstObj.isCollidedWith(secondObj)) { 
        firstObj.collideWith(secondObj); 
      }
    }
  } 
}

Game.prototype.step = function() { 
  this.moveObjects(); 
  this.checkCollisions(); 
}

Game.prototype.remove = function(asteroid) { 
  const indexOfAsteroid = this.asteroids.indexOf(asteroid); 
  this.asteroids.splice(indexOfAsteroid, 1); 
}

Game.prototype.allObjects = function() { 
  return this.asteroids.concat(this.ship); 
}

module.exports = Game;


