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

    feature 'logging in' do   
      given(:test_user) { create(:user) }  
      before(:each) do 
        visit new_session_url  
        fill_in 'Username', with: "#{test_user.username}"
        fill_in 'Password', with: "#{test_user.password}" 
        click_on 'Login' 
      end
      scenario 'shows username on homepage after login' do   
        expect(page).to have_content("#{test_user.username}")
        expect(page).to have_current_path("/users/#{User.find_by(username: test_user.username).id}")
      end
    end
  end 
end
