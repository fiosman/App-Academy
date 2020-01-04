require 'rails_helper'

RSpec.feature "GoalPrivacy", type: :feature do

  feature 'visitibility status' do   
    given!(:main_user) { create(:user) } 
    given!(:alt_user) { create(:user) } 
    given!(:main_goal) { create(:goal, user_id: main_user.id) }
    given!(:alt_goal) { create(:goal, user_id: alt_user.id, visible: true) }
    feature 'modifying visibility status' do  
      scenario "does not allow user to edit visibility status of other users" do  
        login_as(main_user) 
        visit goal_url(alt_goal) 
        save_and_open_page
      end 

      scenario 'allow user to edit own visibility status' do   
      end 
    end
  
    feature 'viewing goals' do   
      scenario 'does not allow user to view other users private goals' do  
      end 

      scenario 'user can view own private goals' do    
      end
    end

  end
end
