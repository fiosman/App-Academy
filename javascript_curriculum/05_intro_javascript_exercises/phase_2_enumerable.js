function Array(array) { 
  this.array = array;
}

Array.prototype.myEach = function(callback) { 
  for (let i = 0; i < this.array.length; i++) { 
    callback(this.array[i]); 
  }
}
