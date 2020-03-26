//Surrogate approach
Function.prototype.inherits = function(parent) { 
  function Surrogate() {}; 
  Surrogate.prototype = parent.prototype; 
  this.prototype = new Surrogate(); 
  this.prototype.constructor = this; 
}

//Object.create approach
Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

