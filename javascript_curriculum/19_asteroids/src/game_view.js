const Game = require('./game.js');

function GameView(ctx) { 
  this.ctx = ctx;
  game = new Game(); 
}

GameView.prototype.start = function() { 
  let self = this; 
  setInterval(function() { 
    game.step();  
    game.draw(self.ctx); 
    self.bindKeyHandlers();
  }, 20)
}

GameView.prototype.bindKeyHandlers = function() { 
  const impulseKeys = { 
    'w': [0, -0.08], 
    's': [0, 0.08], 
    'a': [-0.08, 0], 
    'd': [0.08, 0]
  }; 

  if (key.isPressed('w')) { 
    game.ship.power(impulseKeys['w']);
  } else if (key.isPressed('s')) { 
    game.ship.power(impulseKeys["s"]);
  } else if (key.isPressed('a')) { 
    game.ship.power(impulseKeys["a"]);
  } else if (key.isPressed('d')) { 
    game.ship.power(impulseKeys["d"]);
  }
}

module.exports = GameView;