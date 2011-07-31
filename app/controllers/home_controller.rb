class HomeController < ApplicationController
  def index
    @banners= Welcome.all(:conditions=>['visible=?',true])
  end

end
