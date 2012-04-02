class Admin::MenusController < ApplicationController
  before_filter :require_login  
  layout'admin'        
  def index
    @menus = Menu.where("parent is ?", nil).order("position")
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params[:menu])
    if @menu.save
      redirect_to admin_menu_url(@menu), :notice => "Successfully created admin/menu."
    else
      render :action => 'new'
    end
  end
  
  def sort
    @menus = Menu.all
    @menus.each do |menu|
      menu.position = params['menu'].index(menu.id.to_s) + 1
      menu.save
    end
    render :nothing => true
  end
  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      redirect_to admin_menu_url(@menu), :notice  => "Successfully updated admin/menu."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_menus_url, :notice => "Successfully destroyed admin/menu."
  end
end
