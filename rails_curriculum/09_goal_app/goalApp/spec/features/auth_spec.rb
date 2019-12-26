require 'rails_helper'

RSpec.feature "User Auth", type: :feature do
  feature 'the signup process' do 
    scenario 'has a new user page' do    
      visit '/users/new'
      expect(page).to have_content('New User')
    end 

    feature 'signing up a user' do  
      before(:each) do    
        visit '/users/new' 
        fill_in 'Username', with: 'fiosman' 
        fill_in 'Password', with: 'lol12345678'
        click_on 'Create User'
      end  
      scenario 'shows the username on the homepage after signup' do 
        expect(page).to have_current_path("/users/#{User.find_by(username: 'fiosman').id}")
        expect(page).to have_content('fiosman')
      end
    end
  end 
end
