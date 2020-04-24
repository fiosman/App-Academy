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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = { 
  followUser: function(id) { 
    return $.ajax({ 
      url: `/users/${id}/follow`, 
      type: 'POST', 
      dataType: 'JSON'
    }); 
  }, 
  unfollowUser: function(id) { 
    return $.ajax({ 
      url: `/users/${id}/follow`, 
      type: 'DELETE', 
      dataType: 'JSON'
    }); 
  }, 
  searchUsers: function(queryVal) { 
    return $.ajax({ 
      url: `/users/search`,
      type: 'GET', 
      dataType: 'JSON',
      data: {query: queryVal}
    });
  }, 
  createTweet: function(data) { 
    return $.ajax({ 
      url: '/tweets', 
      type: 'POST', 
      dataType: 'JSON', 
      data: data
    });
  }
}

module.exports = APIUtil; 


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class FollowToggle {
  constructor($el, options) {
    this.$el = $el;
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;
    this.render();
    this.handleClick();
  }

  render() {
    switch(this.followState) { 
      case 'followed': 
        this.$el.prop("disabled", false); 
        this.$el.text("Unfollow"); 
        break; 
      case 'following': 
        this.$el.prop("disabled", true); 
        this.$el.text("Following..."); 
        break; 
      case 'unfollowed': 
        this.$el.prop("disabled", false); 
        this.$el.text("Follow"); 
        break; 
      case 'unfollowing': 
        this.$el.prop("disabled", true); 
        this.$el.text("Unfollowing...")
    }
  }

  handleClick() {
    let self = this;
    this.$el.on("click", function (e) {
      e.preventDefault();
      if (self.followState === "unfollowed") {
        self.followState = "following"; 
        self.render();
        APIUtil.followUser(self.userId).then(() => {
          self.followState = "followed";
          self.render();
        });
      } else if (self.followState === "followed"){
        self.followState = "unfollowing"; 
        self.render(); 
        APIUtil.unfollowUser(self.userId).then(() => {
          self.followState = "unfollowed";
          self.render();
        });
      }
    });
  }
}

module.exports = FollowToggle;


/***/ }),

/***/ "./frontend/tweet_compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet_compose.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class TweetCompose {
  constructor($form) {
    this.$form = $form;
    this.$form.find("textarea").on("input", this.handleInput.bind(this));
    this.$form.find(".add-mention").on("click", this.newUserSelect.bind(this));
    this.$mentionedUsersUl = this.$form.find(".mentioned-users"); 
    this.$mentionedUsersUl.on("click", ".remove-mentioned-user", this.removeMentionedUser.bind(this))
    this.$form.on("submit", this.submit.bind(this));
  }

  handleInput(e) {
    let maxCharCount = 140;
    let currentTextLength = e.currentTarget.value.length;
    let currentCharCount = maxCharCount - currentTextLength;

    this.$form
      .find("strong.chars-left")
      .text(`${currentCharCount} characters left`);
  }

  submit(e) {
    e.preventDefault();
    const $formInputs = this.$form.find(":input");
    const $formData = $(e.currentTarget).serialize();

    $formInputs.prop("disabled", true);
    APIUtil.createTweet($formData).then(this.handleSuccess.bind(this));
  }

  clearInput() {
    const $formInputs = this.$form.find(
      ":input:not(input[type='Submit'], input[type='hidden'])"
    );
    $formInputs.val("");
  }

  handleSuccess(data) {
    this.clearInput();
    const $disabledInputs = this.$form.find(":input:disabled");
    $disabledInputs.removeAttr("disabled");

    const $targetUl = this.$form.data("tweets-ul");
    const tweet = JSON.stringify(data);

    $($targetUl).prepend(`<li>${tweet}</li>`);
  }

  newUserSelect() {
    const $selectEle = $("<select name='tweet[mentioned_user_ids][]'>");
    const $wrapper = $("<div>");
    const $removeMentionedUser = $('<button type="button">')
      .html("Remove")
      .addClass("remove-mentioned-user");
    const users = window.users;

    users.forEach((user) => {
      $selectEle.append(`<option value=${user.id}>${user.username}</option>`);
    });
    $wrapper.append($selectEle).insertAfter("textarea");
    $wrapper.append($removeMentionedUser);
    this.$mentionedUsersUl.append($wrapper);
  }

  removeMentionedUser() {}
}

module.exports = TweetCompose;


/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js");
const TweetCompose = __webpack_require__(/*! ./tweet_compose.js */ "./frontend/tweet_compose.js")

$(() => {
  $("button.follow-toggle").each(function () {
    new FollowToggle($(this));
  });

  $("nav.users-search").each(function () {
    new UsersSearch($(this));
  });

  $("form.tweet-compose").each(function() { 
    new TweetCompose($(this)); 
  }); 

});


/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.$input = this.$el.find("input#users-search-field");
    this.$ul = this.$el.find("ul.users");
    this.handleInput();
  }

  handleInput() {
    this.$input.on("input", () => {
      APIUtil.searchUsers(this.$input.val()).then((users) => {
        this.renderResults(users);
      });
    });
  }

  renderResults(users) {
    this.$ul.empty();

    for (let i = 0; i < users.length; i++) {
      let $button = $("<button>");
      new FollowToggle($button, {
        userId: users[i].id,
        followState: users[i].followed ? "followed" : "unfollowed"
      });
      let $li = $("<li>").html(`<a href=/users/${users[i].id}> ${users[i].username}</a> `); 
      $li.append($button);
      this.$ul.append($li);
    }
    return this.$ul;
  }
}

module.exports = UsersSearch;


/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map