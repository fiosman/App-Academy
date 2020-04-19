const APIUtil = require('./api_util.js'); 

class UsersSearch { 
  constructor($el) { 
    this.$el = $el; 
    this.$input = this.$el.find("input#users-search-field"); 
    this.$ul = this.$el.find("ul.users");
    this.handleInput()
  }

  handleInput() { 
    this.$input.on("input", () => { 
      APIUtil.searchUsers(this.$input.val()).then( users => { 
        this.renderResults(users); 
      })
    })
  }

  renderResults(users) { 
    this.$ul.empty(); 

    for (let i = 0; i < users.length; i++) { 
      let $li = $("<li>").html(`<a href=/users/${users[i].id}> ${users[i].username}</a>`); 
      this.$ul.append($li); 
    }
    return this.$ul; 
  }

}

module.exports = UsersSearch;