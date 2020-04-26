const APIUtil = { 
  followUser: function(id) { 
    return $.ajax({ 
      url: `/users/${id}/follow`, 
      type: 'POST', 
      dataType: 'JSON'
    }); 
  }, 
  unfollowUser: function(id) { 
    return $.ajax({ 
      url: `/users/${id}/follow`, 
      type: 'DELETE', 
      dataType: 'JSON'
    }); 
  }, 
  searchUsers: function(queryVal) { 
    return $.ajax({ 
      url: `/users/search`,
      type: 'GET', 
      dataType: 'JSON',
      data: {query: queryVal}
    });
  }, 
  createTweet: function(data) { 
    return $.ajax({ 
      url: '/tweets', 
      type: 'POST', 
      dataType: 'JSON', 
      data: data
    });
  },
  fetchTweets: function(data) { 
    return $.ajax({ 
      url: '/feed', 
      type: 'GET', 
      dataType: 'JSON', 
      data: data
    }); 
  }
}

module.exports = APIUtil; 
