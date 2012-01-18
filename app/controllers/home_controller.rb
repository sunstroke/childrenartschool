# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true], :order=>:position)
    @title=''
  end

end
