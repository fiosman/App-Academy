import React from 'react'; 
import ReactDOM from 'react-dom'; 

function ToDos() { 
  return ( 
    <h1>ToDos App</h1>
  )
}

document.addEventListener("DOMContentLoaded", () => { 
  const root = document.getElementById("content"); 
  ReactDOM.render(<ToDos/>, root); 
})