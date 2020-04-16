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

/***/ "./src/apple.js":
/*!**********************!*\
  !*** ./src/apple.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Apple { \n  constructor(position) { \n    this.position = position; \n  }\n  \n  collidedWithSnake(snakePos) { \n    return JSON.stringify(snakePos) === JSON.stringify(this.position);\n  }\n}\n\nmodule.exports = Apple;\n\n//# sourceURL=webpack:///./src/apple.js?");

/***/ }),

/***/ "./src/board.js":
/*!**********************!*\
  !*** ./src/board.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Snake = __webpack_require__(/*! ./snake.js */ \"./src/snake.js\");\nconst Apple = __webpack_require__(/*! ./apple.js */ \"./src/apple.js\");\nclass Board {\n  constructor(gridSize) {\n    this.gridSize = gridSize;\n    this.snake = new Snake([\n      Math.floor(this.gridSize / 2),\n      Math.floor(this.gridSize / 2),\n    ]);\n    this.apple = this.generateApple(); \n  }\n\n  isValidPos(pos) {\n    const [x, y] = pos;\n    return x > -1 && x < this.gridSize && y > -1 && y < this.gridSize;\n  }\n\n  isOccupiedBySnake(pos) {\n    return this.snake.position === pos;\n  }\n\n  generateApple() {\n    const potentialApplePos = [\n      Math.floor(Math.random() * this.gridSize),\n      Math.floor(Math.random() * this.gridSize),\n    ];\n\n    if (!this.isOccupiedBySnake(potentialApplePos)) {\n      return new Apple(potentialApplePos);\n    } else {\n      this.generateApple();\n    }\n  }\n}\n\nmodule.exports = Board;\n\n\n//# sourceURL=webpack:///./src/board.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Board = __webpack_require__(/*! ./board.js */ \"./src/board.js\");\nconst SnakeView = __webpack_require__(/*! ./snake-view.js */ \"./src/snake-view.js\");\n\n$(() => {\n  const $rootEl = $(\".game-area\");\n  new SnakeView($rootEl);\n});\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/snake-view.js":
/*!***************************!*\
  !*** ./src/snake-view.js ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Board = __webpack_require__(/*! ./board.js */ \"./src/board.js\");\nconst Snake = __webpack_require__(/*! ./snake.js */ \"./src/snake.js\");\n\nclass SnakeView {\n  constructor($gameArea) {\n    this.$gameArea = $gameArea;\n    this.board = new Board(20);\n    this.setUpGrid(this.$gameArea);\n    this.moveHandler();\n    this.timer = null;\n  }\n\n  setUpGrid($gameArea) {\n    for (let yPos = 0; yPos < this.board.gridSize; yPos++) {\n      const $tr = $(\"<tr>\");\n      $gameArea.append($tr);\n      for (let xPos = 0; xPos < this.board.gridSize; xPos++) {\n        const $td = $(\"<td>\");\n        $td.data(\"cell-pos\", [xPos, yPos]);\n        $tr.append($td);\n      }\n    }\n    const initialSnakePos = this.board.snake.position;\n    const initialApplePos = this.board.apple.position;\n\n    this.findEle(initialSnakePos).addClass(\"snake\");\n    this.findEle(initialApplePos).addClass(\"apple\");\n  }\n\n  findEle(val) {\n    return $(\"td\").filter(function () {\n      let cellpos = $(this).data(\"cell-pos\");\n      return JSON.stringify(cellpos) === JSON.stringify(val);\n    });\n  }\n\n  drawObjects() {\n    if (this.board.isValidPos(this.board.snake.position)) {\n      this.board.snake.move();\n      $(\"td.snake\").removeClass(\"snake\");\n      const newSnake = this.findEle(this.board.snake.position);\n      newSnake.addClass(\"snake\");\n      if (this.board.apple.collidedWithSnake(this.board.snake.position)) {\n        let segmentPos = this.board.apple.position;\n        this.board.snake.growSnake(segmentPos);\n        $(\"td.apple\").removeClass().addClass(\"snake-segment\");\n        this.board.apple = this.board.generateApple();\n        const newApple = this.findEle(this.board.apple.position);\n        newApple.addClass(\"apple\");\n      }\n    } else {\n      alert(\"you lose\");\n    }\n  }\n\n  animateSnake() { \n    let self = this;\n    this.timer = setInterval(function() { \n      self.drawObjects(); \n    }, 1000)\n  }\n\n  moveHandler() {\n    const snake = this.board.snake;\n    let self = this;\n    $(document).keydown(function (e) {\n      switch (e.which) {\n        case 37: //left\n          if (snake.direction === \"E\" || snake.direction === \"W\") {\n            clearInterval(self.timer)\n            self.timer = self.animateSnake();\n          } else {\n            snake.turn(\"W\");\n            clearInterval(self.timer)\n            self.timer = self.animateSnake();\n          }\n          break;\n        case 39: //right\n          if (snake.direction === \"E\" || snake.direction === \"W\") { \n            clearInterval(self.timer)\n            self.timer = self.animateSnake();\n          } else {\n            clearInterval(self.timer)\n            snake.turn(\"E\");\n            self.timer = self.animateSnake();\n          }\n          break;\n        case 40: //down arrow\n          if (snake.direction === \"S\" || snake.direction === \"N\") {\n            clearInterval(self.timer)\n            self.animateSnake();\n          } else {\n            clearInterval(self.timer)\n            snake.turn(\"S\");\n            self.timer = self.animateSnake();\n          }\n          break;\n        case 38: //up arrow\n          if (snake.direction === \"S\" || snake.direction === \"N\") {\n            clearInterval(self.timer)\n            self.timer = self.animateSnake();\n          } else {\n            clearInterval(self.timer)\n            snake.turn(\"N\");\n            self.timer = self.animateSnake();\n          }\n          break\n      }\n    });\n  }\n}\n\nmodule.exports = SnakeView;\n\n\n//# sourceURL=webpack:///./src/snake-view.js?");

/***/ }),

/***/ "./src/snake.js":
/*!**********************!*\
  !*** ./src/snake.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Snake {\n  constructor(position) {\n    this.direction = \"E\";\n    this.position = position;\n    this.segments = [this.position];\n  }\n\n  move() {\n    switch (this.direction) {\n      case \"N\":\n        this.position[1] -= 1\n        break;\n      case \"S\":\n        this.position[1] += 1;\n        break;\n      case \"E\":\n        this.position[0] += 1; \n        break;\n      case \"W\":\n        this.position[0] -= 1;\n        break;\n    }\n  }\n\n  turn(direction) {\n    this.direction = direction;\n  }\n\n  growSnake(snakePos) {\n    this.segments.push(snakePos);\n  }\n\n  head() { \n    return this.segments[0]; \n  }\n}\n\n  module.exports = Snake;\n\n//# sourceURL=webpack:///./src/snake.js?");

/***/ })

/******/ });