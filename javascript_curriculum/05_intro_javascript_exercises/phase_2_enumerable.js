Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

Array.prototype.myMap = function (callback) {
  let newArr = [];

  this.myEach(function (ele) {
    newArr.push(callback(ele));
  })

  return newArr;
}
