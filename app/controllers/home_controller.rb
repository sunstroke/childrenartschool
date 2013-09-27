# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
before_filter :setup_negative_captcha, :only => [:index]    
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true], :order=>:position)
    @directions= Direction.where('visible=?',true).order("position").limit(3)
    @groups = Group.all(:conditions=>['open=? and finish>?',true, Time.now], :order=>:start)
    @news=LiveNews.where('visible=?',true).order("position").limit(3)
    @title='Детская Школа Искусств'
    @person=Person.new
    @group=Group.first
  end
  private

       def setup_negative_captcha
         @captcha = NegativeCaptcha.new(
           :secret => '90f36c6e333640f5a8fc2016fa4637062c3fdc23636ee03d8974d3b251090d8981dc759c36fe12bff820dd33f1cf993f029bfc62ac9d908b352309a2d2129862', #A secret key entered in environment.rb.  'rake secret' will give you a good one.
           :spinner => request.remote_ip, 
           :fields => [:fullname,:current_group,:tel,:mail,:about], #Whatever fields are in your form 
           :params => params)
       end  

end
