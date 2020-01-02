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
    given(:goal) { create(:goal, title: 'Test Title', user_id: test_user.id) }
    scenario "shows a user's goals on the index page" do   
      visit goals_url(goal)
      expect(page).to have_content('Test Title') 
      click_link('Test Title') 
      expect(page).to have_current_path(goal_url(Goal.find_by(title: 'Test Title').id))
    end
  end

  feature 'updating goals' do 
    given(:goal) { create(:goal, user_id: test_user.id) }
    scenario 'should have a page for updating a goal' do      
      visit edit_goal_url(goal)
      expect(find_field('Title').value).to eq(goal.title)
    end

    scenario 'should display the updated goal on the show page after success' do
      visit edit_goal_url(goal)
      fill_in 'Title', with: 'Updated Goal!' 
      click_on 'Update Goal' 
      expect(page).to have_current_path(goal_url(goal)) 
      expect(page).to have_content('Goal updated!')
      expect(page).to have_content('Updated Goal!')
    end
  end
  
  feature 'deleting goals' do
    given(:goal) { create(:goal, user_id: test_user.id) }   
    scenario 'allow a user to delete a goal' do   
      visit goals_url(goal)
      click_on "Delete #{goal.title}" 
      expect(page).not_to have_content(goal.title) 
      expect(page).to have_content('Goal deleted!')
    end 
  end 
end
