class UserMailer < ActionMailer::Base
  default :from => "robot@school-f.ru"
  def welcome_email(user)
    @user = user
    mail(:to => "k.sunstroke@gmail.com, ekaterina.motyleva@school-f.ru, children@school-f.ru",
         :subject => "Новая заявка в группу #{@user.group.name}")
  end  
end
