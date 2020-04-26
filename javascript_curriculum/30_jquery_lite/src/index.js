window.$l = function (selector) {
  const nodeList = document.querySelectorAll(selector);
  let arrNodes = [];
  nodeList.forEach((node) => {
    arrNodes.push(node);
  });
  return arrNodes;
};

