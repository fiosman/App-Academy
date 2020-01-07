require 'rails_helper'

RSpec.feature "Comment", type: :feature do     
  given!(:test_user) { create(:user) } 
  given!(:alt_user) { create(:user) }
  given!(:test_goal) { create(:goal, user_id: test_user.id, visible: true )}

  feature 'adding comments' do  
    background(:each) do     
      login_as(alt_user)
    end
    scenario 'allows comments to be added to a user show page' do   
      visit user_url(test_user) 
      fill_in 'Comment', with: 'Awesome progress' 
      click_on 'Save comment' 
      expect(page).to have_content('Comment saved')
      expect(page).to have_current_path("/users/#{test_user.id}")
      expect(page).to have_content('Awesome progress') 
    end 

    scenario 'allows comments to be added to a goal show page' do   
      visit goal_url(test_goal) 
      fill_in 'Comment', with: 'Great goal' 
      click_on 'Save comment' 
      expect(page).to have_content('Great goal') 
      expect(page).to have_content('Comment saved') 
      expect(page).to have_current_path("/goals/#{test_goal.id}")
    end 
  end 

  feature 'viewing comments' do    

  end 

end
