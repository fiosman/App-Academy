const Game = require('./game.js'); 
const readline = require('readline'); 
const reader = readline.createInterface({ 
  input: process.stdin, 
  output: process.stdout
}); 

let game = new Game(); 
game.run(reader, playAgain); 

const playAgain = function() { 
  reader.question('Play again? y : n', ans => { 
    if (ans === 'y') { 
      game = new Game(); 
      game.run(reader, playAgain); 
    } else { 
      reader.close();
    }
  });
}; 

