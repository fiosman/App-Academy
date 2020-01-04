require 'rails_helper'

RSpec.feature "GoalPrivacy", type: :feature do
  feature 'modifying visibility status' do   
  end
  
  feature 'viewing goals' do   
    scenario 'does not allow user to view other users private goals' do  
    end 

    scenario 'user can view own private goals' do    
    end
  end
end
