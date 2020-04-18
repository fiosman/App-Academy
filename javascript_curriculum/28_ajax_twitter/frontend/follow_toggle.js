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
        $.ajax({
          url: `/users/${self.userId}/follow`,
          type: "POST",
          dataType: "json",
          success: function () {
            self.followState = "followed";
            self.render();
          },
          error: function (e) {
            console.log(e);
          },
        });
      } else {
        $.ajax({
          url: `/users/${self.userId}/follow`,
          type: "DELETE",
          dataType: "json",
          success: function () {
            self.followState = "unfollowed";
            self.render();
          },
          error: function (e) {
            console.log(e);
          },
        });
      }
    })
  }
}

module.exports = FollowToggle;
