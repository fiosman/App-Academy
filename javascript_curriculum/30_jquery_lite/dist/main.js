/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(htmlElements) {\n    this.htmlElements = htmlElements;\n  }\n\n  html() {\n    if (arguments.length == 1) {\n      this.htmlElements.forEach(\n        (element) => (element.innerHTML = arguments[0])\n      );\n    } else {\n      this.htmlElements[0].innerHTML;\n    }\n  }\n\n  empty() {\n    this.html(\"\");\n  }\n\n  append(args) {\n    args = $l(args);\n\n    args.htmlElements.forEach((ele) => {\n      let eleOuterHTML = ele.outerHTML;\n      for (let i = 0; i < this.htmlElements.length; i++) {\n        let currentHTMLElement = this.htmlElements[i];\n        currentHTMLElement.innerHTML += eleOuterHTML;\n      }\n    });\n  }\n\n  attr() {\n    const attributeName = arguments[0];\n    const attributeVal = arguments[1];\n\n    if (attributeName && attributeVal) {\n      this.htmlElements.forEach((ele) => {\n        ele.setAttribute(attributeName, attributeVal);\n      });\n    } else if (attributeName && !attributeVal) {\n      return this.htmlElements[0].getAttribute(attributeName);\n    } else {\n      throw \"invalid arguments\";\n    }\n  }\n\n  addClass(classList) {\n    if (typeof classList === \"string\") {\n      classList = classList.split(\" \");\n      this.htmlElements.forEach((ele) => {\n        ele.classList.add(...classList);\n      });\n    }\n  }\n\n  removeClass(classList) {\n    if (typeof classList === \"string\") {\n      classList = classList.split(\" \");\n      this.htmlElements.forEach((ele) => {\n        ele.classList.remove(...classList);\n      });\n    }\n  }\n\n  children() {\n    let childNodes = [];\n    this.htmlElements.forEach((ele) => {\n      for (let i = 0; i < ele.children.length; i++) {\n        childNodes.push(ele.children[i]);\n      }\n    });\n    return new DOMNodeCollection(childNodes);\n  }\n\n  parent() {\n    let parentNodes = [];\n    this.htmlElements.forEach((ele) => {\n      let potentialParent = ele.parentElement;\n      if (parentNodes[parentNodes.length - 1] !== potentialParent) {\n        parentNodes.push(potentialParent);\n      }\n    });\n    return new DOMNodeCollection(parentNodes);\n  }\n\n  find(selector) {\n    let resNodes = [];\n    this.htmlElements.forEach((node) => {\n      let nodeList = node.querySelectorAll(selector);\n      resNodes.push(Array.from(nodeList));\n    });\n    return new DOMNodeCollection(resNodes);\n  }\n\n  remove() {\n    this.htmlElements.forEach((ele) => {\n      ele.remove();\n    });\n  }\n\n  on(event, callback) {\n    this.htmlElements.forEach((ele) => {\n      ele.handler = callback; //A node inside this.htmlElements is just an object, so we can set a property on it!\n      ele.addEventListener(event, callback);\n    });\n  }\n\n  off(event) {\n    this.htmlElements.forEach((ele) => {\n      const targetHandler = le.handler;\n      ele.removeEventListener(event, targetHandler);\n    });\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nwindow.$l = function (element) {\n  let arrFunctions = Array.from(arguments).filter((ele) => {\n    return typeof ele === \"function\";\n  });\n\n  if (document.readyState === \"complete\") {\n    arrFunctions.forEach((fn) => {\n      fn();\n    });\n  }\n\n  if (element instanceof HTMLElement) {\n    const node = new DOMNodeCollection([element]);\n    return node;\n  } else if (element instanceof String || typeof element === \"string\") {\n    const nodeList = document.querySelectorAll(element);\n    const nodes = new DOMNodeCollection(Array.from(nodeList));\n    return nodes;\n  }\n};\n\nwindow.$l.extend = function (firstObj, ...args) {\n  args.forEach((arg) => {\n    let keyValPairs = Object.entries(arg); \n    for (let i = 0; i < keyValPairs.length; i++ ) { \n      let [key, val] = keyValPairs[i];\n      firstObj[key] = val;\n    }\n  });\n\n  return firstObj;\n};\n\nwindow.$l.ajax = function (opts) {\n  const defaults = {\n    method: \"GET\",\n    url: \"\",\n    data: {},\n    contentType: \"application/x-www-form-urlencoded; charset=UTF-8\",\n    success: () => {},\n    error: () => {},\n  };\n\n  opts = window.$l.extend(defaults, opts);\n\n  const xhr = new XMLHttpRequest();\n\n  xhr.open(opts.method, opts.url, true);\n\n  xhr.onload = function () {\n    if (xhr.status === 200) {\n      opts.success(xhr.response);\n    } else {\n      opts.error(xhr.response);\n    }\n  };\n\n  xhr.send(JSON.stringify(opts.data));\n};\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });