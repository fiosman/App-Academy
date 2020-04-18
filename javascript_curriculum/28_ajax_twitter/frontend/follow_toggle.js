class FollowToggle { 
  constructor($el) { 
    this.userId = $el.data("user-id"); 
    this.followState = $el.data("initial-follow-state"); 
    this.$el = $el; 
    this.render(); 
  }

  render() { 
    if (this.followState === 'unfollowed') { 
      this.$el.text('Follow!'); 
    } else if (this.followState === "followed") { 
      this.$el.text('Unfollow'); 
    }
  }
}

module.exports = FollowToggle;