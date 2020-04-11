const Board = require("./board.js");
const SnakeView = require("./snake-view.js");

$(() => {
  const $rootEl = $(".game-area");
  new SnakeView($rootEl);
});


