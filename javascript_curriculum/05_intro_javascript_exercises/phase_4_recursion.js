const sumRec = arr => { 
  let [first, ...rest] = arr;
  if (arr.length <= 1) { 
    return first;
  }
  return first + sumRec(rest); 
}

const exponent = (base, exp) => { 
  if (exp === 0) { 
    return 1;
  } 
  return base * exponent(base, exp-1);
} 

const secondExponent = (base, exp) => { 
  if (exp === 0) { 
    return 1; 
  } else if (exp === 1) { 
    return base;
  } 

  if (exp % 2 === 0) { 
    return secondExponent(base, exp / 2) * secondExponent(base, exp /2);
  } else { 
    return base * (secondExponent(base, (exp-1) / 2)) * (secondExponent(base, (exp-1) / 2));
  }
}

const fibonacci = n => { 
  fibonacciNums = [0,1];

  if (n < 3) { 
    return fibonacciNums.slice(0,n);
  }
  let fib = fibonacci(n-1); 
  fibonacciNums.push(fib[fibonacciNums.length-1] + fib[fibonacciNums.length-2]); 
  return fibonacciNums;
}

const range = (start, end) => { 
  if (start === end) { 
    return [start];
  }

  arr = range(start, end-1);
  arr.push(end);
  return arr;
  
}

const deepDup = arr => { 
  let duped = []; 

  arr.forEach(ele => { 
    if (ele instanceof Array) { 
      duped.push(deepDup(ele));
    } else { 
      duped.push(ele);
    }
  })
return duped;
}

const bsearch = (arr, target) => { 
  if (arr.length <= 1 && arr[0] != target) { 
    return -1;
  }

  let midIdx = Math.floor(arr.length / 2);

  if (arr[midIdx] === target) { 
    return midIdx; 
  } else if (arr[midIdx] > target) { 
    lowerArr = arr.slice(0, midIdx); 
    return bsearch(lowerArr, target); 
  } else { 
    upperArr = arr.slice(midIdx + 1);
    upperbSearch = bsearch(upperArr, target);
    return upperbSearch === -1 ? -1 : upperbSearch + (midIdx + 1);
  }
}

const mergeSort = arr => { 
  if (arr.length === 1) { 
    return arr;
  }
  const mid = Math.floor(arr.length/2); 
  const left = mergeSort(arr.slice(0, mid)) 
  const right = mergeSort(arr.slice(mid))

  return merge(left, right); 
}

const merge = (left, right) => { 
  const merged = []; 

  let leftArrIdx = 0; 
  let rightArrIdx = 0; 
  while (leftArrIdx < left.length && rightArrIdx < right.length) { 
    if (left[leftArrIdx] < right[rightArrIdx]) {
      merged.push(left[leftArrIdx]); 
      leftArrIdx++;
    } else { 
      merged.push(right[rightArrIdx]); 
      rightArrIdx++;
    }
  }

  while (leftArrIdx < left.length) { 
    merged.push(left[leftArrIdx]); 
    leftArrIdx++; 
  }

  while (rightArrIdx < right.length) {
    merged.push(right[rightArrIdx]);
    rightArrIdx++;
  }

  return merged;
}

const subSets = arr => {  
  if (arr.length === 0) { 
    return [[]]; 
  }

  const subSetsWithoutFirst = subSets(arr.slice(1)); 
  const subSetsWithFirst = subSetsWithoutFirst.map(ele => [arr[0]].concat(ele)); 
  return subSetsWithFirst.concat(subSetsWithoutFirst)
}

