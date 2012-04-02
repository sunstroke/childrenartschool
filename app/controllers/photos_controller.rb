class PhotosController < ApplicationController
  protect_from_forgery :except => :create 
#    before_filter :require_login
    before_filter :find_slideshow
    before_filter :find_or_build_photo

   def create
     # respond_to do |format|
     #   unless @photo.save
     #     flash[:error] = 'Photo could not be uploaded'
     #   end
     #   format.js do
     #     render :text => render_to_string(:partial => 'photos/photo', :locals => {:photo => @photo})
     #   end
     # end
     # 
     # @photo = Photo.new(:image => params[:Filedata])
     # if @photo.save
     #   flash[:notice] = "Successfully created photo."
     #   head :ok
     #   #render :partial => 'slideshow/photos', :object => @photo
     #   # redirect_to @photo
     # else
     #   render :action => 'new'
     # end
         
     @photo = Photo.new(params[:photo])
     respond_to do |format|
       unless @photo.save
         flash[:error] = 'Photo could not be uploaded'
       end
       format.js do
         render :text => render_to_string(:partial => 'photos/photo', :locals => {:photo => @photo})
       end
     end     
     #if @photo.save
      # flash[:notice] = "Successfully created photo."
      # head :ok
       #render :partial => 'slideshow/photos', :object => @photo
       # redirect_to @photo
     #else
      # render :action => 'new'
     #end     
   end
   
def index
  @photos=Photo.all
  
end 
  def show
    @photo=Photo.find(params[:id])
    
  end
def new
  @photo=Photo.new
  
end
def edit
  @photo = Photo.find(params[:id])
end
def destroy
  respond_to do |format|
    unless @photo.destroy
      flash[:error] = 'Photo could not be deleted'
    end
    format.js
  end
end

   private

     def find_slideshow
       if params[:slideshow_id]
         @slideshow = Slideshow.find(params[:slideshow_id])
       else
         @slideshow = Slideshow.find(params[:photo][:slideshow_id])
       end
       raise ActiveRecord::RecordNotFound unless @slideshow
     end

     def find_or_build_photo
       @photo = params[:id] ? @slideshow.photos.find(params[:id]) : @slideshow.photos.build(params[:photo])
     end

end
