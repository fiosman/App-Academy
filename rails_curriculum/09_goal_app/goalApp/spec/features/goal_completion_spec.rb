require 'rails_helper'

RSpec.feature "GoalCompletion", type: :feature do
  feature 'completing goal' do   
    given!(:main_user) { create(:user) }
    given!(:alt_user) { create(:user) } 
    given!(:test_goal) { create(:goal, user_id: main_user.id) }

    background(:each) do   
      login_as(main_user) 
    end

    feature 'starts off incomplete' do  
      scenario 'on the goals index page' do   
        visit goals_url 
        expect(page).to have_content('Ongoing')
      end
      scenario "on the logged in user's show page" do
        visit user_url(main_user)
        expect(page).to have_content('Ongoing')
      end
      scenario "on the logged in user's edit goal page" do  
        visit edit_goal_url(test_goal) 
        expect(page).to have_unchecked_field('goal_completed')
      end
      scenario "on the goal's show page" do  
        visit goal_url(test_goal) 
        expect(page).to have_content('Ongoing') 
      end
    end

    feature 'completing a goal' do   
      scenario 'on the goals index page' do  
        visit goals_url 
        click_on 'Complete' 
        expect(page).to have_content('Completed')
        expect(page).to have_content('Goal updated!')
      end
      scenario "on the logged in user's show page" do   
        visit user_url(main_user) 
        click_on 'Complete'
        expect(page).to have_content('Completed') 
        expect(page).to have_content('Goal updated!')
      end
      scenario "on the logged in user's edit goal page" do 
        visit edit_goal_url(test_goal) 
        check 'Completed?'
        click_on 'Update Goal' 
        expect(page).to have_content('Goal updated!') 
        expect(page).to have_content('Completed')
        expect(page).to have_current_path("/goals/#{test_goal.id}")
      end

      scenario "on the goal's show page" do    
        visit goal_url(test_goal) 
        click_on 'Complete'
        expect(page).to have_content('Completed') 
        expect(page).to have_content ('Goal updated!')
      end
    end

    # scenario "on the logged in user's goals show page" do   
    # end

    # scenario "on another user's goals show page" do   
    # end 

    # scenario "on the logged in user's show page" do    
    # end
    
    # scenario "on another user's show page" do   
    # end 

    # scenario "on the logged in user's edit page" do   
    # end 

    # scenario "on another user's logged in edit page" do   
    # end 
  end
end
