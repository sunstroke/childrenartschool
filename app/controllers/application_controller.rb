# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  
  protect_from_forgery

 
  private
    def not_authenticated
      redirect_to login_url, :alert => "Там секретные материалы, предъяви пропуск!"
    end
end
