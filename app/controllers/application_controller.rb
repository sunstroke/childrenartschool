# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :set_teacher
  after_filter :comment_audit, :only=>[:create, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found  
  protect_from_forgery


  protected
  def rescue_not_found
    render :template => 'application/not_found', :status => :not_found
  end
 
  private
  
  def set_teacher
    @teachers=Teacher.where("visible=true")
    @apikey = 'XXXXXXXXXXXXYYYYYYYYYYYYZZZZZZZZXXXXXXXXXXXXYYYYYYYYYYYYZZZZZZZZ';
    
  end
  
  def comment_audit
    audit=Audit.last
    if audit.user_id&&User.exists?(audit.user_id)
      audit.username=User.find(audit.user_id).email
    else
      audit.username= "с сайта URL " +request.url
    end
    audit.comment= "Пользователь "+audit.username+" "+t(audit.action)+" "+ t(audit.auditable_type)
    audit.save
  end
  
    def not_authenticated
      redirect_to login_url, :alert => "Там секретные материалы, предъяви пропуск!"
    end
end
