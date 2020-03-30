const Game = require('./game.js');

function GameView(ctx) { 
  this.ctx = ctx;
  this.game = new Game(); 
}

GameView.prototype.start = function() { 
  let self = this; 
  setInterval(function() { 
    self.game.step();  
    self.game.draw(self.ctx); 
    self.bindKeyHandlers();
  }, 20)
  setInterval(function() { 
    self.bindFireHandler(); 
  }, 300)
}

GameView.prototype.bindKeyHandlers = function() { 
  const ship = this.game.ship; 
  const controlKeys = { 
    w: [0, -0.05], 
    s: [0, 0.05], 
    a: [-0.05, 0], 
    d: [0.05, 0]
  };  

  Object.keys(controlKeys).forEach(function(k) { 
    if (key.isPressed(k)) { 
      ship.power(controlKeys[k]);
    } 
  }); 
}

GameView.prototype.bindFireHandler = function() { 
  const ship = this.game.ship; 

  if (key.isPressed('space')) { 
    ship.fireBullet(); 
  }
}

module.exports = GameView;
