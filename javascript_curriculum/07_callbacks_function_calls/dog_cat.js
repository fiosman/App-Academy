function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();

// 1st way to call chase 
Noodles.chase(Markov);

// 2nd way to call chase 
Noodles.chase.call(Markov, Noodles); 

// 3rd way to call chase 
Noodles.chase.apply(Markov, [Noodles]);