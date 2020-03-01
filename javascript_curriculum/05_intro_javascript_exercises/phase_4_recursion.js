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