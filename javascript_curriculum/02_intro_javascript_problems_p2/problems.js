// Phase I 

const titleize = (names, callBack) => { 
 let newNames =  names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
 callBack(newNames); 
}

const printNames = (names) => { 
  names.forEach(name => console.log(name));
}

// Phase II 

function Elephant(name, height, tricks) { 
  this.name = name; 
  this.height = height; 
  this.tricks = tricks;
}

Elephant.prototype.trumpet = () => `${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`;
Elephant.prototype.grow = () => this.height += 12; 
Elephant.prototype.addTrick = (trick) => this.tricks.push(trick); 
Elephant.prototype.play = () => `${this.name} is ${this.tricks[Math.floor(Math.random() * this.tricks.length)]}`
