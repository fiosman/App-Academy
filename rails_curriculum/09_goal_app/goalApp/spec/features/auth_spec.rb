require 'rails_helper'

RSpec.feature "User Auth", type: :feature do
  feature 'the signup process' do 
    scenario 'has a new user page' do    
      visit '/users/new'
      expect(page).to have_content('New User')
    end 

    feature 'signing up a user' do 
      before(:each) do    
        sign_up_as('fiosman', 'test12345')
      end  
      scenario 'shows the username on the homepage after signup' do 
        expect(page).to have_current_path("/users/#{User.find_by(username: 'fiosman').id}")
        expect(page).to have_content('fiosman')
      end
    end

    feature 'logging in' do   
      given(:test_user) { create(:user) }  
      before(:each) do 
        login_as(test_user)
      end
      scenario 'shows username on homepage after login' do   
        expect(page).to have_content("#{test_user.username}")
        expect(page).to have_current_path("/users/#{User.find_by(username: test_user.username).id}")
      end
    end

    feature 'logging out' do    
      scenario 'begins with a logged out state' do   
      end 

      scenario "does not show the username on the homepage after logout" do 
      end
    end
  end 
end
