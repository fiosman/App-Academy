Function.prototype.myDebounce = function (interval) {
  let timeout;
  
  return (...args) => {
    const fnCall = () => {
      timeout = null;
      this(...args);
    }
    
    clearTimeout(timeout);
    timeout = setTimeout(fnCall, interval);
  }
}

