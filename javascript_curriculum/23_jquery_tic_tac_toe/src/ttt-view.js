class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    self = this;
    $(this.$el).on("click", "li", function(event) {
      const $cell = $(event.currentTarget);
      self.makeMove($cell);
    });
  }

  makeMove($square) {
    const pos = $square.data("pos");
    const currentPlayer = this.game.currentPlayer;
    const game = this.game;

    //alert user if move is not valid
    try {
      game.playMove(pos);
    } catch (error) {
      alert(error.msg);
    }

    //add currentPlayer class to clicked cell
    $square.addClass(`${currentPlayer} reg-cell`);

    //UI logic
    if (game.isOver()) {
      this.$el.off("click");
      this.$el.addClass("disabled");
      $("li").addClass("game-over"); 

      const winner = game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        $figcaption.html(`Congrats ${winner}, you win!`)
        $(`.${winner}`).removeClass("reg-cell game-over");
        $(`.${winner}`).addClass("winner");
      } else { 
        $figcaption.html('It is a draw!');
      }
      this.$el.append($figcaption);
    }
  }

  setupBoard() {
    let $grid = $("<ul>");

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        const $li = $("<li>");
        $li.attr("data-pos", `[${rowIdx}, ${colIdx}]`);
        $grid.append($li);
      }
    }

    this.$el.append($grid);
  }
}

module.exports = View;
