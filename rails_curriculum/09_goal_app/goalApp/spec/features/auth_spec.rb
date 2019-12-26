require 'rails_helper'

RSpec.feature "User Auth", type: :feature do
  feature 'the signup process' do 

    scenario 'has a new user page' do    
      visit '/users/new'
      expect(page).to have_content('New User')
    end 
  end 
end
