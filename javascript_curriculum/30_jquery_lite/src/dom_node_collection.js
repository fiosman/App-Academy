class DOMNodeCollection { 
  constructor(htmlElement) { 
    this.htmlElements = htmlElements;
  }

  html() { 
    if (arguments.length == 1) { 
      this.htmlElements.forEach(element => element.innerHTML = arguments[0]); 
    } else { 
      this.htmlElement[0].innerHTML;
    }
  }
}

module.exports = DOMNodeCollection; 