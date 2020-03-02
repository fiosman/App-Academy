function Cat(name, owner) { 
  this.name = name; 
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() { 
  return `${this.name} loves ${this.owner}`;
}

cat1 = new Cat('Bob', 'Henrique');
cat2 = new Cat('Freddy', 'Chris');

Cat.prototype.cuteStatement = function() { 
  return `Everyone loves ${this.name}`;
}

Cat.prototype.meow = function() { 
  return `${this.name} goes meow`
}

cat1.meow = function() { 
  return `This one is different`
}
