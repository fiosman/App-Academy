const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");
const TweetCompose = require("./tweet_compose.js")
const InfiniteTweets = require("./infinite_tweets.js");

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

  $("div.infinite-tweets").each(function() { 
    new InfiniteTweets($(this)); 
  })
});
