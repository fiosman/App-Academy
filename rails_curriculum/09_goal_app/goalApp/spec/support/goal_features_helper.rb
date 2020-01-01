module GoalFeaturesHelper
  def create_goal(title, details)
    visit new_goal_url 
    fill_in 'Title', with: title
    fill_in 'Details', with: details 
    check 'Public?' 
    uncheck 'Completed?' 
    click_on 'Create Goal'
  end
end