const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = function (element) {
  let arrFunctions = Array.from(arguments).filter((ele) => {
    return typeof ele === "function";
  });

  if (document.readyState === "complete") {
    arrFunctions.forEach((fn) => {
      fn();
    });
  }

  if (element instanceof HTMLElement) {
    const node = new DOMNodeCollection([element]);
    return node;
  } else if (element instanceof String || typeof element === "string") {
    const nodeList = document.querySelectorAll(element);
    const nodes = new DOMNodeCollection(Array.from(nodeList));
    return nodes;
  }
};
