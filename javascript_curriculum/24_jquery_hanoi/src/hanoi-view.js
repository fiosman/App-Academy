class View { 
  constructor(game, $el) { 
    this.game = game; 
    this.$el = $el; //this is figure
    this.setupTowers();
  }

  setupTowers() { 
    for (let i = 0; i < 3; i++) { 
      const $ul = $("<ul>").addClass("tower").data("tower-id", i); 
      this.$el.append($ul); 
    }

    for (let i = 0; i < 3; i++) { 
      let $li = $("<li>").addClass(`disc-${i}`).data("disc-id", i); 
      $("ul").first().append($li)
    }
  }
}

module.exports = View;