class View {
  constructor(game, $el) {
    this.game = game; 
    this.el = $el; 
    this.setupBoard(); 
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    let $grid = $("<ul></ul>")
    for (let i = 0; i < 9; i++) { 
      const $li = $("<li></li>")
      $grid.append($li); 
    }

    this.el.append($grid); 
  }
}

module.exports = View;
