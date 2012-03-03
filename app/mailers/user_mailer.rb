# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  default :from => "robot@school-f.ru"
  def welcome_email(user)
    @user = user
    mail(:to => "k.sunstroke@gmail.com, ekaterina.motyleva@school-f.ru, children@school-f.ru, victoriya.1801@gmail.com",
         :subject => "Новая заявка в группу #{@user.group.name}")
  end  
  def reset_password_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
end
