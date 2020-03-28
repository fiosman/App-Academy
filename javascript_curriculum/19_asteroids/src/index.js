 const MovingObject = require("./moving_object.js");
 const GameView = require('./game_view.js'); 
//  const Asteroid = require('./asteroid.js'); 

 document.addEventListener("DOMContentLoaded", () => {
   const canvas = document.getElementById("game-canvas");
   const ctx = canvas.getContext("2d"); 
   const gameView = new GameView(ctx); 
   gameView.start(); 
  //  const asteroid = new Asteroid({pos: [20,20]})
  //  asteroid.draw(ctx); 
 });

 window.MovingObject = MovingObject; 

