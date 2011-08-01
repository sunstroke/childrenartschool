class HomeController < ApplicationController
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true], :order=>:position)
  end

end
