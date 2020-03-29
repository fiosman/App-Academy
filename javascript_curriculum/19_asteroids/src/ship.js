const MovingObject = require('./moving_object'); 

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