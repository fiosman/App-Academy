function Array(array) { 
  this.array = array;
}

Array.prototype.myEach = function(callback) { 
  for (let i = 0; i < this.array.length; i++) { 
    callback(this.array[i]); 
  }
}

Array.prototype.myMap = function(callback) { 
  let newArr = []; 

  this.array.myEach(function(ele) { 
    newArr.push(callback(ele)); 
  })

  return newArr; 
}

arr = new Array(['i', 'hate', 'you']) 

console.log(arr.myMap(function(ele) { 
  return ele.upcase; 
}))