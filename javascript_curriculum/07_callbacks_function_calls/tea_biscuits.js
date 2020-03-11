const readline = require('readline'); 

const reader = readline.createInterface({ 
  input: process.stdin, 
  output: process.stdout
}); 

function teaAndBiscuits() { 
  let teaAns, biscuitAns; 
  reader.question('Would you like some tea?', res => { 
    teaAns = res; 
    console.log(`You replied ${teaAns}`);
  });
  reader.question('Would you like some biscuits?', res => { 
    biscuitAns = res;
    console.log(`You replied ${biscuitAns}`);
  });

  let biscuitOrder = biscuitAns === 'yes' ? 'do' : 'don\'t';
  let teaOrder = teaAns === 'yes' ? 'do' : 'don\'t';
  console.log(`So you ${teaOrder} want some tea and you ${biscuitOrder} want biscuits.`)
  reader.close();
}

teaAndBiscuits();