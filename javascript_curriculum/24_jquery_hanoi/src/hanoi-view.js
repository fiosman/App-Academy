class View { 
  constructor(game, $el) { 
    this.game = game; 
    this.$el = $el; 
    this.setupTowers();
  }

  setupTowers() { 
    for (let i = 0; i < 3; i++) { 
      const $ul = $("<ul>").addClass("tower");
      this.$el.append($ul); 
    }
  }
}

module.exports = View;