require 'rails_helper'

RSpec.feature "GoalsCrud", type: :feature do
  given(:test_user) { create(:user) }

  background(:each) do    
    login_as(test_user)
  end 

  feature 'creating goals' do   
    background(:each) do    
      visit new_goal_url  
    end
    scenario 'has a new goal page' do   
      expect(page).to have_content("New Goal")
    end
    scenario 'successful creation of a goal shows goal show page' do    
      fill_in 'Title', with: 'Weightloss Program' 
      fill_in 'Details', with: 'Lose 20 lbs by mid 2020'
      uncheck 'Private?' 
      check 'Completed?'
      click_on 'New Goal' 
      expect(page).to have_current_path(goal_url(Goal.last.id))
      expect(page).to have_content('Finished?')
      expect(page).to have_content('Visibility')
    end
  end

  feature 'reading goals' do    
  end

  feature 'updating goals' do    
  end

  feature 'deleting goals' do  
  end 
end
