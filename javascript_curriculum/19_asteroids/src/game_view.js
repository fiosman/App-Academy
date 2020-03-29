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
  }, 20)
}

module.exports = GameView;