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
      create_comment('Awesome progress', 'users', test_user.id) 
      expect(page).to have_content('Comment saved')
      expect(page).to have_current_path("/users/#{test_user.id}")
      expect(page).to have_content('Awesome progress') 
    end 

    scenario 'allows comments to be added to a goal show page' do   
      create_comment('Great goal', 'goals', test_goal.id) 
      expect(page).to have_content('Great goal') 
      expect(page).to have_content('Comment saved') 
      expect(page).to have_current_path("/goals/#{test_goal.id}")
    end 
  end 

  feature 'viewing comments' do  
    given!(:public_user) { create(:user) }
    background(:each) do     
      login_as(test_user) 
      create_comment('This is a goal comment', 'goals', test_goal.id) 
      create_comment('This is a user comment', 'users', test_user.id) 
    end
    feature 'allows users other than creator to view comments' do    
      background(:each) do    
        login_as(public_user)
      end
      scenario 'on the user show page' do     
        visit user_url(test_user) 
        expect(page).to have_content('This is a user comment') 
      end 

      scenario 'on the goal show page' do  
        visit goal_url(test_goal)
        expect(page).to have_content('This is a goal comment')  
      end 
    end   
  end 

end
