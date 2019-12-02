class UserMailer < ApplicationMailer
  default from: 'everyone@appacademy.io'

  def welcome_email(user)
    @user = user 
    
    mail(to: @user.username, suject: "Welcome to 99 Cats!")
  end
end
