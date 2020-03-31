/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
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
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/js/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__(1);


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	/* globals $ */
	
	var View = __webpack_require__(2);
	
	$(function () {
	  var $easel = $("#easel");
	  new View($easel);
	});


/***/ },
/* 2 */
/***/ function(module, exports) {

	/* jshint esversion: 6 */
	
	function View($el) {
	  this.$el = $el;
	  this.setupEasel();
	}
	
	window._randomColorString = function(){
	  return '#' + Math.random().toString(16).substr(-6);
	};
	
	View.prototype.exercise0 = function () {
	  $('li').removeClass("square");
	};
	
	View.prototype.exercise1 = function() {
	  $("li").addClass("orange");
	};
	
	View.prototype.exercise2 = function() {
	  $('.square').remove();
	};
	
	View.prototype.exercise3 = function() {
	  const h1 = $("<h1>").text("I love jQuery");
	  $("#easel").append(h1);
	};
	
	View.prototype.exercise4 = function() {
	  $(".square:nth-child(even)").text("Jeff");
	  //this could also be solved using iteration and %
	};
	
	View.prototype.exercise5 = function() {
	  //hint: look at line 98 of this file: we set the 'data-pos' of every square
	  $('.square').on("click", e => {
	    const $sq = $(e.currentTarget);
	    alert($sq.attr("data-pos"));
	  });
	};
	
	View.prototype.exercise6 = function() {
	  $('.square').each( (idx, el) => {
	    var $sq = $(el);
	    $sq.css("background-color", _randomColorString());
	  })
	};
	
	View.prototype.exercise7 = function() {
	  $('#easel').on("mouseenter", ".square", e => {
	    const $sq = $(e.currentTarget);
	    console.log($sq.css("background-color"));
	  });
	};
	
	
	
	View.prototype.setupEasel = function() {
	  const $addRowButton = $('<button>').html('Add a row');
	  this.$el.append($addRowButton);
	  $addRowButton.on("click", this.addRow.bind(this));
	
	  for(let j = 0; j <= 7; j++){
	    const $button = $("<button>").html("Exercise " + j);
	    $button.on("click", this["exercise" + j]);
	    this.$el.append($button);
	  }
	
	  for(let i = 0; i < 20; i ++) {
	    this.addRow();
	  }
	};
	
	View.prototype.addRow = function() {
	  const rowIdx = this.$el.find(".row").length;
	  const $row = $("<ul>").addClass("row").addClass("group");
	  for(let colIdx = 0; colIdx < 20; colIdx++) {
	    const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
	    $square.on("mouseenter", (e) => {
	      const $square = $(e.currentTarget);
	      $square.css("background-color", window._randomColorString());
	    });
	    $row.append($square);
	  }
	  this.$el.append($row);
	};
	
	module.exports = View;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map