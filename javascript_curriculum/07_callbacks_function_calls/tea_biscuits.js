const readline = require('readline'); 

const reader = readline.createInterface({ 
  input: process.stdin, 
  output: process.stdout
}); 

function teaAndBiscuits() {  
  reader.question('Would you like some tea?', teaRes => { 
    console.log(`You replied ${teaRes}`);
    reader.question('Would you like some biscuits?', biscuitRes => { 
      console.log(`You replied ${biscuitRes}`);
      const biscuitOrder = biscuitRes === 'yes' ? 'do' : 'don\'t';
      const teaOrder = teaRes === 'yes' ? 'do' : 'don\'t';
      console.log(`So you ${teaOrder} want some tea and you ${biscuitOrder} want biscuits.`); 
      reader.close();
    });
  });
}

teaAndBiscuits();