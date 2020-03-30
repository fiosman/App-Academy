 const MovingObject = require("./moving_object.js");
 const GameView = require('./game_view.js'); 
 
 document.addEventListener("DOMContentLoaded", function() {
   const canvas = document.getElementById("game-canvas");
   const ctx = canvas.getContext("2d"); 
   const gameView = new GameView(ctx); 
   gameView.start(); 
 });

 window.MovingObject = MovingObject; 

