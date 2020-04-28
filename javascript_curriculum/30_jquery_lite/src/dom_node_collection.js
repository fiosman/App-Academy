class DOMNodeCollection {
  constructor(htmlElements) {
    this.htmlElements = htmlElements;
  }

  html() {
    if (arguments.length == 1) {
      this.htmlElements.forEach(
        (element) => (element.innerHTML = arguments[0])
      );
    } else {
      this.htmlElements[0].innerHTML;
    }
  }

  empty() {
    this.html("");
  }

  append(args) {
    args = $l(args);

    args.htmlElements.forEach((ele) => {
      let eleOuterHTML = ele.outerHTML;
      for (let i = 0; i < this.htmlElements.length; i++) {
        let currentHTMLElement = this.htmlElements[i];
        currentHTMLElement.innerHTML += eleOuterHTML;
      }
    });
  }

  attr() {
    const attributeName = arguments[0];
    const attributeVal = arguments[1];

    if (attributeName && attributeVal) {
      this.htmlElements.forEach((ele) => {
        ele.setAttribute(attributeName, attributeVal);
      });
    } else if (attributeName && !attributeVal) {
      return this.htmlElements[0].getAttribute(attributeName);
    } else {
      throw "invalid arguments";
    }
  }

  addClass(classList) {
    if (typeof classList === "string") {
      classList = classList.split(" ");
      this.htmlElements.forEach((ele) => {
        ele.classList.add(...classList);
      });
    }
  }

  removeClass(classList) {
    if (typeof classList === "string") {
      classList = classList.split(" ");
      this.htmlElements.forEach((ele) => {
        ele.classList.remove(...classList);
      });
    }
  }

  children() {
    let childNodes = [];
    this.htmlElements.forEach((ele) => {
      for (let i = 0; i < ele.children.length; i++) {
        childNodes.push($l(ele.children[i]));
      }
    });

    return childNodes;
  }
}

module.exports = DOMNodeCollection;
