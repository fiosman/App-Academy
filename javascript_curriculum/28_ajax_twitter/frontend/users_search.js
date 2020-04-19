const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

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
