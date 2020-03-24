document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById('mycanvas'); 
  myCanvas.width = 500; 
  myCanvas.height = 500;
  const ctx = myCanvas.getContext('2d');
  
  ctx.fillStyle = 'red'; 
  ctx.fillRect(0,0,500,500);

  ctx.beginPath(); 
  ctx.arc(250, 250, 200, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green"; 
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'blue';
  ctx.fill();
});
