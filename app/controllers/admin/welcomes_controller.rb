class Admin::WelcomesController < ApplicationController
  # GET /admin/welcomes
  # GET /admin/welcomes.xml
 layout 'admin'  
 
  def index
    @welcomes = Welcome.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @welcomes }
    end
  end

  # GET /admin/welcomes/1
  # GET /admin/welcomes/1.xml
  def show
    @welcome = Welcome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @welcome }
    end
  end

  # GET /admin/welcomes/new
  # GET /admin/welcomes/new.xml
  def new
    @welcome = Welcome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @welcome }
    end
  end

  # GET /admin/welcomes/1/edit
  def edit
    @welcome = Welcome.find(params[:id])
  end

  # POST /admin/welcomes
  # POST /admin/welcomes.xml
  def create
    @welcome = Welcome.new(params[:welcome])

    respond_to do |format|
      if @welcome.save
        format.html { redirect_to(admin_welcome_path(@welcome), :notice => 'Welcome was successfully created.') }
        format.xml  { render :xml => @welcome, :status => :created, :location => @welcome }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @welcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/welcomes/1
  # PUT /admin/welcomes/1.xml
  def update
    @welcome = Welcome.find(params[:id])

    respond_to do |format|
      if @welcome.update_attributes(params[:welcome])
        format.html { redirect_to(admin_welcome_path(@welcome), :notice => 'Welcome was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @welcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/welcomes/1
  # DELETE /admin/welcomes/1.xml
  def destroy
    @welcome = Welcome.find(params[:id])
    @welcome.destroy

    respond_to do |format|
      format.html { redirect_to(admin_welcomes_url) }
      format.xml  { head :ok }
    end
  end
end
