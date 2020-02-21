// Phase I 

const titleize = (names, callBack) => { 
 let newNames =  names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
 callBack(newNames); 
}

const printNames = (names) => { 
  names.forEach(name => console.log(name));
}


