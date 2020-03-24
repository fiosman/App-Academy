const Circle = require("./circle.js");

const circles = [];

window.Game = function (xDim, yDim) {
  this.xDim = xDim;
  this.yDim = yDim;

  for (let i = 0; i < Game.NUM_CIRCLES; ++i) {
    circles.push(
      Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)
    );
  }
};

Game.NUM_CIRCLES = 4000;

Game.prototype.render = function (ctx) {
  //this will empty the canvas
  ctx.clearRect(0, 0, this.xDim, this.yDim);

  circles.forEach(function (circle) {
    circle.render(ctx);
  });
};

Game.prototype.moveCircles = function () {
  circles.forEach( circle => {
    circle.moveRandom(this.xDim, this.yDim);
  });
};

Game.prototype.start = function (canvasEl) {
  // get a 2d canvas drawing context. The canvas API lets us call
  // a `getContext` method on a canvas DOM element.
  const ctx = canvasEl.getContext("2d");

  //this function will update the position of all the circles,
  //clear the canvas, and redraw them
  const animateCallback = () => {
    this.moveCircles();
    this.render(ctx);
    //this will call our animateCallback again, but only when the browser
    //is ready, usually every 1/60th of a second
    requestAnimationFrame(animateCallback);

    //if we didn't know about requestAnimationFrame, we could use setTimeout
    //setTimeout(animateCallback, 1000/60);
  };

  //this will cause the first render and start the endless triggering of
  //the function using requestAnimationFrame
  animateCallback();
};

module.exports = Game;
