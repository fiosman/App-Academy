const View = require('./ttt-view');
const Game = require('./game.js');

  $(() => {
    // Your code here
    const game = new Game(); 
    const grid = $('figure.ttt'); 
    const view = View.new(game, grid); 
  });
