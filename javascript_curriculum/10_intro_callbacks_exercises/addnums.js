const readline = require('readline'); 

const reader = readline.createInterface({ 
  input: process.stdin, 
  output: process.stdout
}); 

function addNumbers(sum, numsLeft, completionCallback) { 
  if (numsLeft > 0) { 
    reader.question('Please enter a number', num => { 
      parsedNum = parseInt(num);
      sum += parsedNum; 
      console.log(`The sum so far is ${sum}`); 
      addNumbers(sum, numsLeft - 1, completionCallback);
    }); 
  } else { 
    completionCallback(sum);
  }
}

addNumbers(0, 3, sum => { 
  console.log(`Total Sum: ${sum}`);
  reader.close();
})
