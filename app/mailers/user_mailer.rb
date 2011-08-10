class UserMailer < ActionMailer::Base
  default :from => "robot@school-f.ru"
  def welcome_email(user)
    @user = user
    mail(:to => "k.sunstroke@gmail.com",
         :subject => "Новая заявка #{@user.fullname}")
  end  
end
