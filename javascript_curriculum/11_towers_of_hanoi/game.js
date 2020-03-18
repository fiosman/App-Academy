// This is for playScript.js
/* const readline = require('readline'); 
const reader = readline.createInterface({ 
  input: process.stdin, 
  output: process.stdout
}); 
 */

class Game { 
  constructor() { 
    this.towers = [[3,2,1], [], []]; 
  }

  promptMove(reader, callback) { 
    console.log(this.towers); 
    reader.question('Which tower are you moving disk from (0, 1, 2)?', start => { 
      const startTowerIdx = parseInt(start);
      reader.question('Which tower are you moving disk to (0, 1, 2)?', end => { 
        const endTowerIdx = parseInt(end);
        callback(startTowerIdx, endTowerIdx);
      });
    });
  }
}
