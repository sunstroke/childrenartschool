class HomeController < ApplicationController
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true], :order=>:position)
    @title="Детская школа визуальных искусств"
  end

end
