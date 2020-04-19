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
  }
}

module.exports = APIUtil; 
