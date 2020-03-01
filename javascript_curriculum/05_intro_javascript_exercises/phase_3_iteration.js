String.prototype.substrings = function () {
  let substrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }

  return substrings;
}

Array.prototype.bubbleSort = function() { 
  let swapped; 

  do {
   swapped = false;
   for (let i = 0; i < this.length; i++) {
     if (this[i] > this[i + 1]) {
       const temp = this[i];
       this[i] = this[i + 1];
       this[i + 1] = temp;
       swapped = true;
     }
    }
  }
  while(swapped === true );
  
  return this;
}
