const Util = { 
  //prototype inheritance utility method 
  inherits: function(childClass, parentClass) { 
    childClass.prototype = Object.create(parentClass.prototype); 
    childClass.prototype.constructor = childClass; 
  }, 
  randomVec: function(length) { 
    const deg = 2 * Math.PI * Math.random(); 
    return this.scale([Math.sin(deg), Math.cos(deg)], length); 
  }, 
  //
  scale: function(vec, m) { 
    return [vec[0] * m, vec[1] * m];
  }, 
  distanceBetweenPoints: function(firstObjXY, secondObjXY) { 
    const [x1, y1] = firstObjXY; 
    const [x2, y2] = secondObjXY; 

    return Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2); 
  }, 
  norm: function(vector) {  
    return this.distanceBetweenPoints([0,0], vector); 
  }, 
  dir: function(vector) { 
    return this.scale(vector, 1 / this.norm(vector));
  }
}; 

module.exports = Util;
