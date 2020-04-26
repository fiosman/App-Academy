const APIUtil = require("./api_util.js");

class InfiniteTweets {
  constructor($el) {
    this.$el = $el;
    this.$el.find(".fetch-more").on("click", this.fetchTweets.bind(this));
    this.maxCreatedAt = null;
    this.$feed = this.$el.find("ul#feed");
  }

  fetchTweets(e) {
    e.preventDefault();

    let data = {};

    if (this.maxCreatedAt) {
      data.max_created_at = this.maxCreatedAt;
    }

    APIUtil.fetchTweets(data).then((res) => {
      this.insertTweets(res);

      if (res.length < 20) {
        this.$el
          .find(".fetch-more")
          .replaceWith("<strong>No more tweets to fetch!</strong>");
      }

      if (res.length > 0) {
        this.maxCreatedAt = res[res.length - 1].created_at;
      }
    });
  }

  insertTweets(tweets) {
    tweets.forEach((tweet) => {
      let $tweetLi = $("<li>").html(`${JSON.stringify(tweet)}`);
      this.$feed.prepend($tweetLi);
    });
  }
}

module.exports = InfiniteTweets;
