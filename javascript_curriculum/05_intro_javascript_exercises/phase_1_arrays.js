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

Array.prototype.twoSum = function() { 
  let arrayKeys = {}; 
  let zeroPairs = []; 

  for (let i = 0; i < this.array.length; i++) { 
    const currentEle = this.array[i];
    const targetVal = arrayKeys[0 - currentEle];

    if (arrayKeys[currentEle] === true) { 
      continue;
    }
    if (targetVal === true) {
      zeroPairs.push([0 - currentEle, currentEle]); 
    }
     arrayKeys[currentEle] = true; 
    }

  return zeroPairs; 
}
