class Admin::LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Successfully created admin/location."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated admin/location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Admin::Location.find(params[:id])
    @location.destroy
    redirect_to admin_locations_url, :notice => "Successfully destroyed admin/location."
  end
end
