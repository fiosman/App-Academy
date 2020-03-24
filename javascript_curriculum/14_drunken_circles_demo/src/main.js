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
/******/ 	return __webpack_require__(__webpack_require__.s = "./game.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./circle.js":
/*!*******************!*\
  !*** ./circle.js ***!
  \*******************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Circle =  function (centerX, centerY, radius, color) {\n  this.centerX = centerX;\n  this.centerY = centerY;\n  this.radius = radius;\n  this.color = color;\n};\n\nCircle.randomCircle = function (maxX, maxY, numCircles) {\n  return new Circle(\n    maxX * Math.random(),\n    maxY * Math.random(),\n    Circle.radius(maxX, maxY, numCircles),\n    Circle.randomColor()\n  );\n};\n\nconst HEX_DIGITS = \"0123456789ABCDEF\";\n\nCircle.randomColor = function () {\n  let color = \"#\";\n  for (let i = 0; i < 6; i++) {\n    color += HEX_DIGITS[Math.floor((Math.random() * 16))];\n  }\n\n  return color;\n};\n\nCircle.radius = function (maxX, maxY, numCircles) {\n  let targetCircleArea = (maxX * maxY) / numCircles;\n  let targetRadius = Math.sqrt(targetCircleArea / Math.PI);\n  return 2 * targetRadius;\n};\n\nCircle.prototype.moveRandom = function (maxX, maxY) {\n  let dx = (Math.random() * 2) - 1;\n  let dy = (Math.random() * 2) - 1;\n\n  this.centerX = Math.abs((this.centerX + (dx * this.radius * 0.1)) % maxX);\n  this.centerY = Math.abs((this.centerY + (dy * this.radius) * 0.1) % maxY);\n};\n\nCircle.prototype.render = function (ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.centerX,\n    this.centerY,\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n\n  ctx.fill();\n};\n\nmodule.exports = Circle;\n\n\n//# sourceURL=webpack:///./circle.js?");

/***/ }),

/***/ "./game.js":
/*!*****************!*\
  !*** ./game.js ***!
  \*****************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Circle = __webpack_require__(/*! ./circle.js */ \"./circle.js\");\n\nconst circles = [];\n\nwindow.Game = function (xDim, yDim) {\n  this.xDim = xDim;\n  this.yDim = yDim;\n\n  for (let i = 0; i < Game.NUM_CIRCLES; ++i) {\n    circles.push(\n      Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)\n    );\n  }\n};\n\nGame.NUM_CIRCLES = 4000;\n\nGame.prototype.render = function (ctx) {\n  //this will empty the canvas\n  ctx.clearRect(0, 0, this.xDim, this.yDim);\n\n  circles.forEach(function (circle) {\n    circle.render(ctx);\n  });\n};\n\nGame.prototype.moveCircles = function () {\n  circles.forEach( circle => {\n    circle.moveRandom(this.xDim, this.yDim);\n  });\n};\n\nGame.prototype.start = function (canvasEl) {\n  // get a 2d canvas drawing context. The canvas API lets us call\n  // a `getContext` method on a canvas DOM element.\n  const ctx = canvasEl.getContext(\"2d\");\n\n  //this function will update the position of all the circles,\n  //clear the canvas, and redraw them\n  const animateCallback = () => {\n    this.moveCircles();\n    this.render(ctx);\n    //this will call our animateCallback again, but only when the browser\n    //is ready, usually every 1/60th of a second\n    requestAnimationFrame(animateCallback);\n\n    //if we didn't know about requestAnimationFrame, we could use setTimeout\n    //setTimeout(animateCallback, 1000/60);\n  };\n\n  //this will cause the first render and start the endless triggering of\n  //the function using requestAnimationFrame\n  animateCallback();\n};\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./game.js?");

/***/ })

/******/ });