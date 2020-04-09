class View { 
  constructor(game, $el) { 
    this.game = game; 
    this.$el = $el;
    this.from = null;
    this.setupTowers();
    this.clickTower();
    this.render();
  }

  setupTowers() { 
    let $tower, $disc; 

    for (let towerIdx = 0; towerIdx < 3; towerIdx++) { 
      $tower = $("<ul>").addClass("tower").data("tower-id", towerIdx); 
      for (let discIdx = 0; discIdx < 3; discIdx++) { 
        $disc = $("<li>").data("disc-id", discIdx);
        $tower.append($disc); 
        if (this.game.towers[towerIdx].length != 0) { 
          $disc.addClass(`disc-${discIdx}`).data("disc-id", discIdx);
        }
      }
      this.$el.append($tower);
    }
  }
  
  clickTower() { 
    const self = this; 
    this.$el.on("click", "ul", function() {
      const $currentTower = $(this);
      $("ul.selected").removeClass("selected");
      $currentTower.toggleClass("selected"); 
      let $selectedTowerIdx = $currentTower.data("tower-id");
      if (self.from  === null) { 
        self.from = $selectedTowerIdx; 
      } else { 
        if (!self.game.isValidMove(self.from, $selectedTowerIdx)) { 
          alert('Invalid move!');
        } else { 
          self.makeMove(self.from, $selectedTowerIdx);
        }
        self.from = null;
      }
    })
  }

  makeMove($startTowerIdx, $endTowerIdx) { 
    const game = this.game; 
    game.move($startTowerIdx, $endTowerIdx);
    const $startTower = $("ul.tower")
                       .data("tower-id", $startTowerIdx)
                       .find(`li.disc-${$startTowerIdx}`)
                       .removeClass(`disc-${$startTowerIdx}`)
  }

  render() { 
    $("ul.tower").each(function(index) { 
      console.log(index)
    })
  }
}

module.exports = View;