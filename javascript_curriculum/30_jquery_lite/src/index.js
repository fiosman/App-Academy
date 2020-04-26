const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = function (element) {
  let arrNodes = [];
  if (element instanceof HTMLElement) {
    arrNodes.push(new DOMNodeCollection(element));
  } else if (element instanceof String || typeof(element) === 'string') {
    const nodeList = document.querySelectorAll(element);
    nodeList.forEach((node) => {
      arrNodes.push(new DOMNodeCollection(node));
    });
  }
  return arrNodes;
};
