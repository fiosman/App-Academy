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

window.$l.extend = function (firstObj, ...args) {
  args.forEach((arg) => {
    let keyValPairs = Object.entries(arg);
    for (let i = 0; i < keyValPairs.length; i++) {
      let [key, val] = keyValPairs[i];
      firstObj[key] = val;
    }
  });

  return firstObj;
};

window.$l.ajax = function (opts) {
  const defaults = {
    method: "GET",
    url: "",
    data: {},
    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    success: () => {},
    error: () => {},
  };

  opts = window.$l.extend(defaults, opts);

  const xhr = new XMLHttpRequest();

  xhr.open(opts.method, opts.url, true);

  xhr.onload = function () {
    if (xhr.status === 200) {
      opts.success(xhr.response);
    } else {
      opts.error(xhr.response);
    }
  };

  xhr.send(JSON.stringify(opts.data));
};
