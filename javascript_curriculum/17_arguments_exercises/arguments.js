//Solution using arguments keyword
function sum() { 
  let totalSum = 0; 

  for (let i = 0; i < arguments.length; i++) { 
    totalSum += arguments[i]; 
  }

  return totalSum;
}

//Solution using ...rest operator 
function sumRest(...args) { 
  let totalSum = 0; 

  args.forEach(num => { 
    return totalSum += num; 
  })

  return totalSum; 
}

//Solution using arguments keyword
Function.prototype.myBind = function(context) { 
  const bindArgs = Array.from(arguments).slice(1); 
  return () => { 
    const callArgs = Array.from(arguments); 
    return this.apply(context, bindArgs.concat(callArgs)); 
  }
}

//Solution using ... rest operator  
Function.prototype.myBind = function(context, ...bindArgs) {
  return (...callArgs) => { 
    this.apply(context, bindArgs.concat(callArgs)); 
  }
};
