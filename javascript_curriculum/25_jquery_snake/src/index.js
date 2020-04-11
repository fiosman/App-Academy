const Board = require("./board.js");

$(() => {
  const rootEl = $(".game-area");
  let board = new Board(rootEl);
  board.drawGrid();
});


