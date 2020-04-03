class View {
  constructor(game, $el) {
    this.game = game; 
    this.$el = $el; 
    this.setupBoard(); 
  }

  bindEvents() {
    $(this.$el).on("click", "li", function() { 
      this.game.playMove(); 
    })
  }

  makeMove($square) {}

  setupBoard() {
    let $grid = $("<ul>"); 

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) { 
      for (let colIdx = 0; colIdx < 3; colIdx++) { 
        const $li = $("<li>"); 
        $li.attr("data-pos", [rowIdx, colIdx]);  
        $grid.append($li); 
      }
    }

    this.$el.append($grid); 
  }
}

module.exports = View;
