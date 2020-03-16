Function.prototype.myThrottle = function(interval) { 
  let tooSoon = true; 

  return () => { 
    if (tooSoon === false) { 
      tooSoon = true; 
      setTimeout(() => { 
        tooSoon = false; 
      }, interval)

      this();
    }
  }
}