const MovingObject = require('./moving_object'); 
const Bullet = require('./bullet.js');
const Util = require('./util.js');

const DEFAULTS = {
  COLOR: "blue",
  RADIUS: 10
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
  let bullet = new Bullet({ 
    vel: this.vel, 
    game: this.game, 
    pos: this.pos
  }) 
  this.game.bullets.push(bullet); 
}

module.exports = Ship; 