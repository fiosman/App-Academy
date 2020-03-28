const Util = { 
  inherits: function(childClass, parentClass) { 
    childClass.prototype = Object.create(parentClass.prototype); 
    childClass.prototype.constructor = childClass; 
  }, 
  randomVec: function(length) { 
    const deg = 2 * Math.PI * Math.random(); 
    return Util.scale([Math.sin(deg), Math.cos(deg)], length); 
  }, 
  scale: function(vec, m) { 
    return [vec[0] * m, vec[1] * m];
  }
}; 

module.exports = Util;