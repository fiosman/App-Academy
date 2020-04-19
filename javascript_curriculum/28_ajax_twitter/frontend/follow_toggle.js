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
