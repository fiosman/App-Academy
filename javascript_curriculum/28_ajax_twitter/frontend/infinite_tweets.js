const APIUtil = require("./api_util.js");

class InfiniteTweets {
  constructor($el) {
    this.$el = $el;
    this.$el.find(".fetch-more").on("click", this.fetchTweets.bind(this));
    this.maxCreatedAt = null;
    this.$feed = this.$el.find("ul#feed"); 
  }

  fetchTweets() {
    APIUtil.fetchTweets().then(res => { 
      this.insertTweets(res);
    });
  }

  insertTweets(tweets) { 
    tweets.forEach(tweet => { 
      let $tweetLi = $("<li>").html(`${JSON.stringify(tweet)}`); 
      this.$feed.append($tweetLi); 
    })
  }
}

module.exports = InfiniteTweets;
