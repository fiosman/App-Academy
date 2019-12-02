class UserMailer < ApplicationMailer
  default from: 'everyone@appacademy.io'

  def welcome_email(user)
    @user = user 
    
    mail(to: @user.user_name, suject: "Welcome to 99 Cats!")
  end
end
