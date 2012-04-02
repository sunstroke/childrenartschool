# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true], :order=>:position)
    @directions= Direction.where('visible=?',true).order("position").limit(3)
    @groups = Group.all(:conditions=>['open=? and start>?',true,Time.now], :order=>:start)
    @news=LiveNews.where('visible=?',true).order("position").limit(3)
    @title='Детская Школа Визуальных Искусств'
  end

end
