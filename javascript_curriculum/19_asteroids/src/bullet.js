const MovingObject = require('./moving_object.js'); 

const DEFAULTS = { 
  COLOR: 'orange', 
  RADIUS: 3 
}; 

function Bullet(options) { 
  MovingObject.call(this, { 
    color: DEFAULTS.COLOR, 
    radius: DEFAULTS.RADIUS, 
    pos: options.pos, 
    vel: options.vel,
    game: options.game
  }); 
}

module.exports = Bullet; 
