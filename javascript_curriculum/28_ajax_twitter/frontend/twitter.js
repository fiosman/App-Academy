const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");

$(() => {
  $("button.follow-toggle").each(function () {
    console.log(new FollowToggle($(this)));
  });

  $("nav.users-search").each(function () {
    console.log(new UsersSearch($(this)));
  });
});
