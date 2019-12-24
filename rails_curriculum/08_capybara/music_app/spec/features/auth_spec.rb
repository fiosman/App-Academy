require 'rails_helper'

feature 'user features', type: :feature do  

  feature "the signup process" do
    
    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "New User"
    end
  end

  feature "signing up a user" do    
    before(:each) do    
      visit new_user_url 
      fill_in 'Email', with: "testing@email.com" 
      fill_in 'Password', with: "biscuits" 
      click_on "Create user!"
    end

    scenario "redirects to user show page page after signup" do
      expect(current_path).to eq("/users/#{User.find_by(email:"testing@email.com").id}")
      expect(page).to have_content "testing@email.com"
    end
  end

  feature  "with an invalid user" do   
    before(:each) do   
      visit new_user_url   
      fill_in 'Email', with: "testing@email.com" 
      click_on "Create user!"
    end

    scenario "re-renders the signup page after failed signup" do   
      expect(current_path).to eq("/users") 
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end
end

