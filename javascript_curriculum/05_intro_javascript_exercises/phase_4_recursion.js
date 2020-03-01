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
