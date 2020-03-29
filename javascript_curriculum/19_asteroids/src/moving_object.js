const Util = require('./util.js')

function MovingObject(options) {
  this.pos = options["pos"];
  this.vel = options["vel"];
  this.radius = options["radius"];
  this.color = options["color"];
  this.game = options["game"];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, true);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
  const [velX, velY] = this.vel;
  this.pos[0] += velX;
  this.pos[1] += velY;

  this.pos = this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function(otherObject) { 
  const radiiSum = this.radius + otherObject.radius; 
  
  if (Util.distanceBetweenPoints(this.pos, otherObject.pos) < radiiSum) { 
    return true; 
  } else { 
    return false;
  }
}

MovingObject.prototype.collideWith = function(otherObject) { 
}

module.exports = MovingObject; 


