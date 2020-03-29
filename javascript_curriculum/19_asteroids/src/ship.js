const MovingObject = require('./moving_object.js'); 
const Bullet = require('./bullet.js');
const Util = require('./util.js');

const DEFAULTS = {
  COLOR: "blue",
  RADIUS: 15
}; 

function Ship(options) { 
  MovingObject.call(this, { 
    pos: options.pos, 
    game: options.game, 
    color: DEFAULTS.COLOR, 
    radius: DEFAULTS.RADIUS, 
    vel: [0,0]
  }); 
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() { 
  this.pos = this.game.randomPosition(); 
  this.vel = [0,0]; 
}

Ship.prototype.power = function(impulse) { 
  this.vel[0] += impulse[0]; 
  this.vel[1] += impulse[1]; 
}

Ship.prototype.fireBullet = function() { 
  const vectorLength = Util.norm(this.vel); 
  
  if (vectorLength === 0) { 
    return; 
  }

  const relativeVel = Util.scale(Util.dir(this.vel), Bullet.SPEED);
  
  const bulletVel = [relativeVel[0] + this.vel[0], relativeVel[1] + this.vel[1]];

  let bullet = new Bullet({ 
    vel: bulletVel, 
    game: this.game, 
    pos: this.pos
  }); 

  this.game.addBullets(bullet); 
  console.log(this.game.bullets); 
}

module.exports = Ship; 