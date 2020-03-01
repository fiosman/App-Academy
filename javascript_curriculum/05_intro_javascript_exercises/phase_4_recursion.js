const sumRec = arr => { 
  let [first, ...rest] = arr;
  if (arr.length <= 1) { 
    return first;
  }
  return first + sumRec(rest); 
}
