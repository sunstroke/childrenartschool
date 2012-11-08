class Admin::UsersController < ApplicationController
    load_and_authorize_resource
     layout'admin'
  before_filter :require_login
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role="pupil"
    if @user.save
      redirect_to admin_users_url, :notice => "Signed up!"
    else
      render :new
    end
  end
  def index
    @users=User.all
  end
  def show
    @user=User.find(params[:id])
  end
  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to admin_users_url, :notice  => "Successfully updated admin/user."
    else
      render :action => 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, :notice => "Successfully destroyed admin/user."
  end
  
  
end
