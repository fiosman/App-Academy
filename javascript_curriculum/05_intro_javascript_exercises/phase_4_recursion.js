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


