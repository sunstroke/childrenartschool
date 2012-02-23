# -*- encoding : utf-8 -*-
class SlideshowsController < ApplicationController

  before_filter :require_login  
     layout'admin'  
  def index
    @slideshows = Slideshow.all
  end

  def show
    @slideshow = Slideshow.find(params[:id])
  end

  def new
    @slideshow = Slideshow.new
  end

  def create
    @slideshow = Slideshow.new(params[:slideshow])
    if @slideshow.save
      redirect_to slideshow_url(@slideshow), :notice => "Successfully created slideshow."
    else
      render :action => 'new'
    end
  end

  def edit
    @slideshow = Slideshow.find(params[:id])
  end

  def update
    @slideshow = Slideshow.find(params[:id])
    @slideshow.photos.each do |photo|
      photo.img.recreate_versions!
    end
    
    if @slideshow.update_attributes(params[:slideshow])
      redirect_to slideshow_url(@slideshow), :notice  => "Successfully updated slideshow."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @slideshow = Slideshow.find(params[:id])
    @slideshow.destroy
    redirect_to slideshows_url, :notice => "Successfully destroyed slideshow."
  end
end
