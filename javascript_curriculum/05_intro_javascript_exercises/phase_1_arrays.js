Array.prototype.uniq = function () {
  let uniqArr = [];

  this.forEach(ele => {
    if (uniqArr[uniqArr.length - 1] != ele) {
      uniqArr.push(ele);
    }
  })
  return uniqArr;
}

Array.prototype.twoSum = function () {
  let arrayKeys = {};
  let zeroPairs = [];

  for (let i = 0; i < this.length; i++) {
    const currentEle = this[i];
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

Array.prototype.transpose = function () {
  let transposedArr = [];
  let newRows = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      newRows.push(this[j][i]);
    }
    transposedArr.push(newRows);
    newRows = [];
  }

  return transposedArr;
}


