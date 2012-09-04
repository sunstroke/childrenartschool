# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  default :from => "robot@school-f.ru"
  def welcome_email(user)
    @user = user
    mail(:to => "k.sunstroke@gmail.com, alexandra@school-f.ru, alexey.tkachev@school-f.ru,  mashafoto@mail.ru ",
         :subject => "Новая заявка в группу #{@user.group.name}")
  end  
  def reset_password_email(user)
    @user = user
    @url  = "http://school-f.ru/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
end
