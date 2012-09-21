# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  after_filter :comment_audit, :only=>[:create, :update, :destroy]
  protect_from_forgery

 
  private
  
  def comment_audit
    audit=Audit.last
    audit.username=current_user.email
    audit.comment= "Пользователь "+audit.username+" "+t(audit.action)+" "+ t(audit.auditable_type)
    audit.save
  end
  
    def not_authenticated
      redirect_to login_url, :alert => "Там секретные материалы, предъяви пропуск!"
    end
end
