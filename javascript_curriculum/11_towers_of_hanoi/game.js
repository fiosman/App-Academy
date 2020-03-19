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

  isValidMove(startTowerIdx, endTowerIdx) { 
    const startArrLength = this.towers[startTowerIdx].length;
    const endArrLength = this.towers[endTowerIdx].length;
    const removedStartTowerDisc = this.towers[startTowerIdx][startArrLength - 1]; 
    const lastEndTowerDisc = this.towers[endTowerIdx][endArrLength - 1]; 

    if (this.towers[endTowerIdx].length === 0) { 
      return true; 
    } else if (removedStartTowerDisc < lastEndTowerDisc) { 
      return true;
    } else { 
      return false;
    }
  }

  print() { 
    console.log(JSON.stringify(this.towers));
  }
}

