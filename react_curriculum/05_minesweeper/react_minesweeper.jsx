import React from 'react'; 
import ReactDOM from 'react-dom'; 
import Game from "./components/game.jsx"

function ReactMineSweeper() { 
  return ( 
    <div>
    <h1>Minesweeper</h1>
    <Game/>
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => { 
  const root = document.getElementById("root"); 
  ReactDOM.render(<ReactMineSweeper/>, root); 
})