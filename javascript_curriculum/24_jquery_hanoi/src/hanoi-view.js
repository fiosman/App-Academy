class View { 
  constructor(game, $el) { 
    this.game = game; 
    this.$el = $el;
    this.from = null;
    this.setupTowers();
    this.clickTower();
  }

  setupTowers() { 
    for (let i = 0; i < 3; i++) { 
      const $ul = $("<ul>").addClass("tower").data("tower-id", i); 
      this.$el.append($ul); 
    }

    for (let i = 0; i < 3; i++) { 
      let $li = $("<li>").addClass(`disc-${i}`).data("disc-id", i); 
      $("ul").first().append($li);
    }
  }
  
  clickTower() { 
    const self = this; 

    this.$el.on("click", "ul", function(event) { 
      let $selectedTowerIdx = $(event.currentTarget).data("tower-id");
      if (self.from  === null) { 
        self.from = $selectedTowerIdx; 
      } else { 
        if (!self.game.isValidMove(self.from, $selectedTowerIdx)) { 
          alert('Invalid move!');
        };
        self.makeMove(self.from, $selectedTowerIdx)
        self.from = null;
      }
    })
  }

  makeMove($startTowerIdx, $endTowerIdx) { 
    console.log($startTowerIdx, $endTowerIdx);
  }
}

module.exports = View;