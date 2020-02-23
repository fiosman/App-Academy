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

Elephant.prototype.trumpet = function() { 
  console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
}

Elephant.prototype.grow = function() { 
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) { 
  this.tricks.push(trick);
} 

Elephant.prototype.play = function() { 
  console.log(`${this.name} is ${this.tricks[Math.floor(Math.random() * this.tricks.length)]}`);
}

// Phase III 

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) { 
  console.log(`${elephant.name} is trotting by!`); 
};

herd.forEach(Elephant.paradeHelper)

// Phase IV

function dinerBreakfast() { 
  order = "I'd like cheesy scrambled eggs and bacon" 
  function addToDiner(item) { 
    order = `${order} and ${item}`
    console.log(order + ' please');
  }
  return addToDiner;
}

let breakfastOrder = dinerBreakfast(); 
breakfastOrder('Cookies'); 
breakfastOrder('Pancakes');
