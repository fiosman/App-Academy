require 'rails_helper'

RSpec.feature "GoalPrivacy", type: :feature do

  feature 'visitibility status' do   
    given!(:main_user) { create(:user) } 
    given!(:alt_user) { create(:user) } 
    given!(:main_goal) { create(:goal, user_id: main_user.id) }
    given!(:alt_goal_private) { create(:goal, user_id: alt_user.id) }
    given!(:alt_goal_public) { create(:goal, user_id: alt_user.id, visible: true) }

    feature 'public goals' do 
      background(:each) { login_as(main_user) } 

      scenario 'does not allow user to edit other users public goals visibility' do
        visit edit_goal_url(alt_goal_public) 
        expect(page).to have_content('Not your goal to edit!')
      end

      scenario 'private status upon creation of a goal' do    
       visit goal_url(main_goal) 
       expect(page).to have_content('Private')
      end

      scenario 'allow user to edit own visibility status' do  
        visit edit_goal_url(main_goal) 
        check 'Public?'
        click_on 'Update'
        expect(page).to have_content('Goal updated!') 
        expect(page).to have_content('Public') 
      end 

      scenario 'user can see other users goals' do   
        visit user_url(alt_user) 
        save_and_open_page
        expect(page).to have_content('Public')
        expect(page).to have_content(alt_goal_public.title)
      end

    end
  
    feature 'private goals' do   
      scenario 'does not allow user to view other users private goals' do  
      end 

      scenario 'user can view own private goals' do    
      end
    end

      # scenario "does not allow user to edit others private goals visibility" do  
      #   visit edit_goal_url(alt_goal_private) 
      #   expect(page).to have_content("Not your goal to edit!")
      #   expect(page).to have_current_path("/users/#{alt_user.id}")
      # end 

  end
end
