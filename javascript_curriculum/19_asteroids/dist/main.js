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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n\nconst DEFAULTS = { \n  COLOR: 'gray', \n  RADIUS: 20, \n  SPEED: 5\n}; \n\nfunction Asteroid(options) { \n  MovingObject.call(this, { \n    pos: options['pos'], \n    vel: Util.randomVec(DEFAULTS['SPEED']), \n    color: DEFAULTS['COLOR'], \n    radius: DEFAULTS['RADIUS']\n  })\n}\n\nUtil.inherits(Asteroid, MovingObject)\n\nmodule.exports = Asteroid; \n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\"); \nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Game() { \n  this.asteroids = []; \n  \n  this.addAsteroids(); \n}\n\nGame.DIM_X = 1200;\nGame.DIM_Y = 800;\nGame.NUM_ASTEROIDS = 50;\n\nGame.prototype.addAsteroids = function() { \n  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) { \n    this.asteroids.push(new Asteroid({pos: this.randomPosition()})); \n  }\n}\n\nGame.prototype.randomPosition = function() { \n  return [\n    Math.floor(Math.random() * Game.DIM_X), \n    Math.floor(Math.random() * Game.DIM_Y)\n  ];\n}\n\nGame.prototype.draw = function(ctx) { \n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y); \n  this.asteroids.forEach(function(asteroid) { \n    asteroid.draw(ctx); \n  }); \n}\n\nGame.prototype.moveObjects = function() { \n  this.asteroids.forEach(function(asteroid) { \n    asteroid.move(); \n  }); \n}\n\nGame.prototype.wrap = function(pos) { \n  const [posX, posY] = pos; \n\n  if (posX < 0) { \n    posX = Game.DIM_X; \n  } else if (posX > Game.DIM_X) { \n    posX = 0; \n  }\n\n  if (posY < 0) { \n    posY = Game.DIM_Y; \n  } else if (posY > Game.DIM_Y) { \n    posY = 0; \n  }\n\n  return [posX, posY]; \n}\n\nmodule.exports = Game;\n\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) { \n  this.ctx = ctx;\n  game = new Game(); \n}\n\nGameView.prototype.start = function() { \n  let self = this; \n  setInterval(function() { \n    game.moveObjects(); \n    game.draw(self.ctx); \n  }, 20)\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval(" const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n const GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\"); \n//  const Asteroid = require('./asteroid.js'); \n\n document.addEventListener(\"DOMContentLoaded\", () => {\n   const canvas = document.getElementById(\"game-canvas\");\n   const ctx = canvas.getContext(\"2d\"); \n   const gameView = new GameView(ctx); \n   gameView.start(); \n  //  const asteroid = new Asteroid({pos: [20,20]})\n  //  asteroid.draw(ctx); \n });\n\n window.MovingObject = MovingObject; \n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n  this.pos = options[\"pos\"];\n  this.vel = options[\"vel\"];\n  this.radius = options[\"radius\"];\n  this.color = options[\"color\"];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, true);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  const [velX, velY] = this.vel;\n  this.pos[0] += velX;\n  this.pos[1] += velY;\n};\n\nMovingObject.prototype.isOutOfBounds = function(relativePosX, relativePosY) {\n  const objectPosX = this.pos[0];\n  const objectPosY = this.pos[1];\n  if (objectPosX > relativePosX || objectPosX < relativePosX) {\n    return objectPosX; \n  } else if (objectPosY > relativePosY || objectPosY < relativePosY) {\n    return objectPosY; \n  } else {\n    return false;\n  }\n};\n\nmodule.exports = MovingObject; \n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = { \n  inherits: function(childClass, parentClass) { \n    childClass.prototype = Object.create(parentClass.prototype); \n    childClass.prototype.constructor = childClass; \n  }, \n  randomVec: function(length) { \n    const deg = 2 * Math.PI * Math.random(); \n    return Util.scale([Math.sin(deg), Math.cos(deg)], length); \n  }, \n  scale: function(vec, m) { \n    return [vec[0] * m, vec[1] * m];\n  }\n}; \n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });