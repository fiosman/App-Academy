class Game {
  constructor() {
    this.towers = [
      [3, 2, 1],
      [],
      []
    ];
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

    if (this.towers[startTowerIdx].length === 0) {
      return false;
    } else if (this.towers[endTowerIdx].length === 0) {
      return true;
    } else if (removedStartTowerDisc < lastEndTowerDisc) {
      return true;
    }
  }

  move(startTowerIdx, endTowerIdx) {
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      const movedDisc = this.towers[startTowerIdx].pop();
      this.towers[endTowerIdx].push(movedDisc);
      this.print();
      return true;
    }
    this.print();
    return false;
  }

  print() {
    console.log(JSON.stringify(this.towers));
  }

  isWon() {
    for (let i = 1; i < this.towers.length; i++) {
      if (this.towers[i].length === 3) {
        return true;
      }
    }
    return false;
  }

  run(reader, completionCallBack) {
    this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
      if (!this.move(startTowerIdx, endTowerIdx)) {
        console.log('Invalid Move');
      }
      if (!this.isWon()) {
        this.run(reader, completionCallBack);
      } else {
        this.print();
        console.log('Congratulations you have won!');
        completionCallBack();
      }
    })
  }
}

module.exports = Game;



