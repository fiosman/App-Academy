Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

Array.prototype.myMap = function(callback) {
  let newArr = [];

  this.myEach(function (ele) {
    newArr.push(callback(ele));
  })

  return newArr;
}

Array.prototype.myReduce = function(cb, initialValue) { 
  let arr = this; 

  if (initialValue === undefined) { 
    initialValue = this[0]; 
    arr = this.slice(1);
  }

  let res = initialValue; 
  arr.myEach(ele => res = cb(res, ele)); 
  return res;
}
