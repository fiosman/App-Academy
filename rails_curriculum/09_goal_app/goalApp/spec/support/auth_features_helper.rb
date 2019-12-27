module AuthFeaturesHelper
  def sign_up_as(username, password)
    visit '/users/new' 
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Create User'
  end

  def login_as(user)
    visit new_session_url
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
  end
end