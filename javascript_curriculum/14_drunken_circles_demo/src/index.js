const Game = require('./game.js')

const canvasEl = document.getElementsByTagName("canvas")[0];
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
new Game(
  canvasEl.width,
  canvasEl.height
).start(canvasEl);