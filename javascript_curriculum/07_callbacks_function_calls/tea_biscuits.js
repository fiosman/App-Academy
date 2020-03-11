const readline = require('readline'); 

const reader = readline.createInterface({ 
  input: process.stdin, 
  output: process.stdout
}); 

function teaAndBiscuits() { 
  let teaAns, biscuitAns; 
  reader.question('Would you like some tea?', teaRes => { 
    teaAns = teaRes; 
    console.log(`You replied ${teaAns}`);
  reader.question('Would you like some biscuits?', biscuitRes => { 
    biscuitAns = biscuitRes;
    console.log(`You replied ${biscuitAns}`);
  const biscuitOrder = biscuitAns === 'yes' ? 'do' : 'don\'t';
  const teaOrder = teaAns === 'yes' ? 'do' : 'don\'t';
  console.log(`So you ${teaOrder} want some tea and you ${biscuitOrder} want biscuits.`); 
  reader.close();
  });
});
  

}

teaAndBiscuits();