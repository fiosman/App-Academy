const Util = { 
  inherits: function(childClass, parentClass) { 
    childClass.prototype = Object.create(parentClass.prototype); 
    childClass.prototype.constructor = childClass; 
  }
}

module.exports = Util;