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

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\n\nconst DEFAULTS = { \n  COLOR: 'gray', \n  RADIUS: 20, \n  SPEED: 5\n}; \n\nfunction Asteroid(options) { \n  MovingObject.call(this, { \n    pos: options['pos'], \n    vel: Util.randomVec(DEFAULTS['SPEED']), \n    color: DEFAULTS['COLOR'], \n    radius: DEFAULTS['RADIUS'],\n    game: options['game']\n  });\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject) { \n  if (otherObject instanceof Ship) { \n    otherObject.relocate(); \n  } else if (otherObject instanceof Bullet) { \n    this.game.remove(this); \n    this.game.remove(otherObject);\n  }\n}\n\n\nmodule.exports = Asteroid; \n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\"); \nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\"); \n\nconst DEFAULTS = { \n  COLOR: 'red', \n  RADIUS: 5\n}; \n\nfunction Bullet(options) { \n  MovingObject.call(this, { \n    color: DEFAULTS.COLOR, \n    radius: DEFAULTS.RADIUS, \n    pos: options.pos, \n    vel: options.vel,\n    game: options.game\n  }); \n}\n\nBullet.SPEED = 5;\n\nUtil.inherits(Bullet, MovingObject);\n\nBullet.prototype.isWrappable = false; \n\nmodule.exports = Bullet; \n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\"); \nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\"); \nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\"); \n\nconst SETTINGS = { \n  DIM_X: 1600,\n  DIM_Y: 800,\n  NUM_ASTEROIDS: 20,\n  BG_COLOR: 'black'\n} \n\nfunction Game() { \n  this.asteroids = []; \n  this.bullets = []; \n  this.ship = new Ship({ \n    pos: this.randomPosition(), \n    game: this\n  }); \n  this.addAsteroids(); \n}\n\nGame.prototype.addAsteroids = function() { \n  for (let i = 0; i < SETTINGS['NUM_ASTEROIDS']; i++) { \n    this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this})); \n  }\n}\n\nGame.prototype.addBullets = function(bullet) { \n  this.bullets.push(bullet); \n}\n\nGame.prototype.randomPosition = function() { \n  return [\n    Math.floor(Math.random() * SETTINGS[\"DIM_X\"]),\n    Math.floor(Math.random() * SETTINGS[\"DIM_Y\"])\n  ];\n}\n\nGame.prototype.draw = function(ctx) { \n  ctx.clearRect(0, 0, SETTINGS[\"DIM_X\"], SETTINGS[\"DIM_Y\"]); \n  ctx.fillStyle = (SETTINGS['BG_COLOR']); \n  ctx.fillRect(0,0,SETTINGS['DIM_X'], SETTINGS['DIM_Y']);\n  this.allObjects().forEach(function(object) { \n    object.draw(ctx); \n  }); \n}\n\nGame.prototype.moveObjects = function() { \n  this.allObjects().forEach(function(object) { \n    object.move(); \n  }); \n}\n\nGame.prototype.wrap = function(pos) { \n  let [posX, posY] = pos; \n\n  if (posX < 0) { \n    posX = SETTINGS[\"DIM_X\"]; \n  } else if (posX > SETTINGS[\"DIM_X\"]) { \n    posX = 0; \n  }\n\n  if (posY < 0) { \n    posY = SETTINGS[\"DIM_Y\"]; \n  } else if (posY > SETTINGS[\"DIM_Y\"]) { \n    posY = 0; \n  }\n\n  return [posX, posY]; \n}\n\nGame.prototype.checkCollisions = function() { \n  for (let i = 0; i < this.allObjects().length; i++) { \n    for (let j = i + 1; j < this.allObjects().length; j++) { \n      const firstObj = this.allObjects()[i]; \n      const secondObj = this.allObjects()[j]; \n      if (firstObj.isCollidedWith(secondObj)) { \n        firstObj.collideWith(secondObj); \n      }\n    }\n  } \n}\n\nGame.prototype.step = function() { \n  this.moveObjects(); \n  this.checkCollisions(); \n}\n\nGame.prototype.allObjects = function() { \n  return this.asteroids.concat(this.ship, this.bullets); \n}\n\nGame.prototype.isOutOfBounds = function(pos) { \n  const [posX, posY] = pos; \n\n  if (posX < 0 || posX > SETTINGS[\"DIM_X\"]) {\n    return true;\n  } else if (posY < 0 || posY > SETTINGS[\"DIM_Y\"]) {\n    return true;\n  } else {\n    return false;\n  }\n}\n\nGame.prototype.remove = function(obj) { \n  if (obj instanceof Asteroid) { \n    const asteroidIdx = this.asteroids.indexOf(obj); \n    this.asteroids.splice(asteroidIdx, 1)\n  } else if (obj instanceof Bullet) { \n    const bulletIdx = this.bullets.indexOf(obj); \n    this.bullets.splice(bulletIdx, 1); \n  }\n}\n\nmodule.exports = Game;\n\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) { \n  this.ctx = ctx;\n  this.game = new Game(); \n}\n\nGameView.prototype.start = function() { \n  let self = this; \n  setInterval(function() { \n    self.game.step();  \n    self.game.draw(self.ctx); \n    self.bindKeyHandlers();\n  }, 20)\n  setInterval(function() { \n    self.bindFireHandler(); \n  }, 300)\n}\n\nGameView.prototype.bindKeyHandlers = function() { \n  const ship = this.game.ship; \n  const controlKeys = { \n    w: [0, -0.08], \n    s: [0, 0.08], \n    a: [-0.08, 0], \n    d: [0.08, 0]\n  }; \n\n  Object.keys(controlKeys).forEach(function(k) { \n    if (key.isPressed(k)) { \n      ship.power(controlKeys[k]);\n    } \n  }); \n}\n\nGameView.prototype.bindFireHandler = function() { \n  const ship = this.game.ship; \n\n  if (key.isPressed('space')) { \n    ship.fireBullet(); \n  }\n}\n\nmodule.exports = GameView;\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

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
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\n\nfunction MovingObject(options) {\n  this.pos = options[\"pos\"];\n  this.vel = options[\"vel\"];\n  this.radius = options[\"radius\"];\n  this.color = options[\"color\"];\n  this.game = options[\"game\"];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, true);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  const [velX, velY] = this.vel;\n  this.pos[0] += velX;\n  this.pos[1] += velY;\n  if (this.game.isOutOfBounds(this.pos)) {\n    if (this.isWrappable) {\n      this.pos = this.game.wrap(this.pos);\n    } else {\n      this.game.remove(this);\n    }\n  }\n  this.pos = this.game.wrap(this.pos); \n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) { \n  const radiiSum = this.radius + otherObject.radius; \n  \n  if (Util.distanceBetweenPoints(this.pos, otherObject.pos) < radiiSum) { \n    return true; \n  } else { \n    return false;\n  }\n}\n\nMovingObject.prototype.collideWith = function(otherObject) { \n}\n\nMovingObject.prototype.isWrappable = true; \n\nmodule.exports = MovingObject; \n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\"); \nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nconst DEFAULTS = {\n  COLOR: \"blue\",\n  RADIUS: 15\n}; \n\nfunction Ship(options) { \n  MovingObject.call(this, { \n    pos: options.pos, \n    game: options.game, \n    color: DEFAULTS.COLOR, \n    radius: DEFAULTS.RADIUS, \n    vel: [0,0]\n  }); \n}\n\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function() { \n  this.pos = this.game.randomPosition(); \n  this.vel = [0,0]; \n}\n\nShip.prototype.power = function(impulse) { \n  this.vel[0] += impulse[0]; \n  this.vel[1] += impulse[1]; \n}\n\nShip.prototype.fireBullet = function() { \n  const vectorLength = Util.norm(this.vel); \n  \n  if (vectorLength === 0) { \n    return; \n  }\n\n  const relativeVel = Util.scale(Util.dir(this.vel), Bullet.SPEED);\n  \n  const bulletVel = [relativeVel[0] + this.vel[0], relativeVel[1] + this.vel[1]];\n\n  let bullet = new Bullet({ \n    vel: bulletVel, \n    game: this.game, \n    pos: this.pos\n  }); \n\n  this.game.addBullets(bullet);  \n}\n\nmodule.exports = Ship; \n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = { \n  inherits: function(childClass, parentClass) { \n    childClass.prototype = Object.create(parentClass.prototype); \n    childClass.prototype.constructor = childClass; \n  }, \n  randomVec: function(length) { \n    const deg = 2 * Math.PI * Math.random(); \n    return this.scale([Math.sin(deg), Math.cos(deg)], length); \n  }, \n  scale: function(vec, m) { \n    return [vec[0] * m, vec[1] * m];\n  }, \n  distanceBetweenPoints: function(firstObjXY, secondObjXY) { \n    const [x1, y1] = firstObjXY; \n    const [x2, y2] = secondObjXY; \n\n    return Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2); \n  }, \n  norm: function(vector) {  \n    return this.distanceBetweenPoints([0,0], vector); \n  }, \n  dir: function(vector) { \n    return this.scale(vector, 1 / this.norm(vector));\n  }\n}; \n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });