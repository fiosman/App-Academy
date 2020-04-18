const FollowToggle = require('./follow_toggle.js'); 

$(() => { 
  $("button.follow-toggle").each(function() { 
    new FollowToggle($(this)); 
  }); 
})
