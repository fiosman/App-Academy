function Array(array) { 
  this.array = array;
}

Array.prototype.uniq = function() { 
  let uniqArr = []; 

  this.array.forEach(ele => { 
    if (uniqArr[uniqArr.length-1] != ele) { 
      uniqArr.push(ele);
    }
  })
  return uniqArr;
}
