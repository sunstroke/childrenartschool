# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true], :order=>:position)
    @directions= Direction.all(:conditions=>['visible=?',true], :order=>:position)
    @groups = Group.all(:conditions=>['open=? and start>?',true,Time.now], :order=>:start)
    @news=LiveNews.all(:conditions=>['visible=?',true], :order=>:position)
    @title='Детская Школа Визуальных Искусств'
  end

end
