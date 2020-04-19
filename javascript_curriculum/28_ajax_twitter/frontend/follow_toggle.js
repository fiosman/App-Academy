const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor($el) {
    this.userId = $el.data("user-id");
    this.followState = $el.data("initial-follow-state");
    this.$el = $el;
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow");
    }
  }

  handleClick() {
    let self = this;

    this.$el.on("click", function (e) {
      e.preventDefault();
      if (self.followState === "unfollowed") {
        APIUtil.followUser(self.userId).then(() => {
          self.followState = "followed";
          self.render();
        });
      } else {
        APIUtil.unfollowUser(self.userId).then(() => {
          self.followState = "unfollowed";
          self.render();
        });
      }
    });
  }
}

module.exports = FollowToggle;
