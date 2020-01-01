require 'rails_helper'

RSpec.feature "GoalsCrud", type: :feature do
  given(:test_user) { create(:user) }

  background(:each) do    
    login_as(test_user)
  end 

  feature 'creating goals' do   
    scenario 'has a new goal page' do   
      visit new_goal_url  
      expect(page).to have_content("New Goal")
    end
  end

  feature 'reading goals' do    
  end

  feature 'updating goals' do    
  end

  feature 'deleting goals' do  
  end 
end
