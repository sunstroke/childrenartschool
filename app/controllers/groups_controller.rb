# -*- encoding : utf-8 -*-
class GroupsController < ApplicationController
before_filter :setup_negative_captcha, :only => [:show, :view]  
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.find(:all,:order=>["program_id ASC, position ASC"], :conditions=>["open=?",true])
    
    # render :layout => 'admin'
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @groups }
    # end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])
    @person = Person.new(:group=>@group)    
    @title=@group.name+", "+@group.program.name
    # render :layout => 'admin'
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @group }
       format.pdf do
         render :pdf => "file_name"
       end       
     end
  end
  def view
    @group = Group.find_by_label(params[:label])
    @person = Person.new(:group=>@group)    
    @title=@group.name+", "+@group.program.name
    # render :layout => 'admin'           
    render :action=>"show"
  end
  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new
    render :layout => 'admin' 
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @group }
    # end
  end

  # GET /groups/1/edit
  def edit

    @group = Group.find(params[:id])
    render :layout => 'admin'    
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
  private

       def setup_negative_captcha
         @captcha = NegativeCaptcha.new(
           :secret => '90f36c6e333640f5a8fc2016fa4637062c3fdc23636ee03d8974d3b251090d8981dc759c36fe12bff820dd33f1cf993f029bfc62ac9d908b352309a2d2129862', #A secret key entered in environment.rb.  'rake secret' will give you a good one.
           :spinner => request.remote_ip, 
           :fields => [:fullname,:current_group,:tel,:mail,:about], #Whatever fields are in your form 
           :params => params)
       end
  
end
