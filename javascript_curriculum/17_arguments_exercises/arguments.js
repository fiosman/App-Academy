//Solution using arguments keyword
function sum() { 
  let totalSum = 0; 

  for (let i = 0; i < arguments.length; i++) { 
    totalSum += arguments[i]; 
  }

  return totalSum;
}

