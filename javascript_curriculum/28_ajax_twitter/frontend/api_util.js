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
  }
}

module.exports = APIUtil; 
