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
      uncheck 'Public?' 
      check 'Completed?'
      click_on 'Create Goal' 
      expect(page).to have_current_path(goal_url(Goal.last.id))
      expect(page).to have_content('Status')
      expect(page).to have_content('Visibility')
    end
  end

  feature 'reading goals' do    
    scenario "shows a user's goals on the index page" do   
      create_goal('Test Title', 'Test Details')
      visit goals_url 
      expect(page).to have_content('Test Title') 
      click_link('Test Title') 
      expect(page).to have_current_path(goal_url(Goal.find_by(title: 'Test Title').id))
    end
  end

  feature 'updating goals' do 
    scenario 'show allow user to update a goal' do      
    end

    scenario 'should display the updated goal on the show page' do   
    end
  end

  feature 'deleting goals' do  
    scenario 'allow a user to delete a goal' do   
    end 
    
    scenario 'display the remaining goals on index page' do    
    end
  end 
end
