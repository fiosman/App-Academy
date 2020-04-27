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

  attr() {}

  addClass(classList) {
    if (typeof classList === "string") {
      classList = classList.split(" ");
      classList.forEach((className) => {
        for (let i = 0; i < this.htmlElements.length; i++) {
          this.htmlElements[i].classList.add(className);
        }
      });
    }
  }

  removeClass() {}
}

module.exports = DOMNodeCollection;
