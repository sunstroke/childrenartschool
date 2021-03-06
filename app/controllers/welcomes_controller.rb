# -*- encoding : utf-8 -*-
class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.xml
  def index
    @welcomes = Welcome.all
    render :layout => 'admin'
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @welcomes }
#    end
  end

  # GET /welcomes/1
  # GET /welcomes/1.xml
  def show
    @welcome = Welcome.find(params[:id])
    # render :layout => 'admin'
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @welcome }
    end
  end

  # GET /welcomes/new
  # GET /welcomes/new.xml
  def new
    @welcome = Welcome.new
    render :layout => 'admin'
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @welcome }
    # end
  end

  # GET /welcomes/1/edit
  def edit
    @welcome = Welcome.find(params[:id])
    render :layout => 'admin'    
  end

  # POST /welcomes
  # POST /welcomes.xml
  def create
    @welcome = Welcome.new(params[:welcome])

    respond_to do |format|
      if @welcome.save
        format.html { redirect_to(@welcome, :notice => 'Welcome was successfully created.') }
        format.xml  { render :xml => @welcome, :status => :created, :location => @welcome }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @welcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /welcomes/1
  # PUT /welcomes/1.xml
  def update
    @welcome = Welcome.find(params[:id])
    if params[:remove_image]
      @welcome.image.remove_image!
    end
    respond_to do |format|
      if @welcome.update_attributes(params[:welcome])
        format.html { redirect_to(@welcome, :notice => 'Welcome was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @welcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1
  # DELETE /welcomes/1.xml
  def destroy
    @welcome = Welcome.find(params[:id])
    @welcome.destroy

    respond_to do |format|
      format.html { redirect_to(welcomes_url) }
      format.xml  { head :ok }
    end
  end
end
