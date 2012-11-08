# -*- encoding : utf-8 -*-

class PeopleController < ApplicationController
before_filter :setup_negative_captcha, :only => [:new, :create]  
  # GET /people
  # GET /people.xml
  def index
    @people = Person.all
    @group = Group.find(params[:group_id])        
    # render :layout => 'admin'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    @person = Person.find(params[:id])
    # render :layout => 'admin'
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new

    @group = Group.find(params[:group_id])
    @title="Подать заявку на обучение в группе: "+@group.name        
    @person = Person.new(:group=>@group)
    #@groups=Group.all(:conditions=>['open=?',true])
     # render :layout => 'admin'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    render :layout => 'admin'    
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.xml
  def create
    
    @group = Group.find(params[:group_id])    
#    @person = Person.new(params[:person])
    @person = Person.new(@captcha.values) #Decrypted params   
    respond_to do |format|
      if @captcha.valid? && @person.save
        @person.update_attributes(params[:person])
        UserMailer.welcome_email(@person).deliver        
        format.html { redirect_to(:back, :notice => 'заявка подана') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        flash[:notice] = @captcha.error if @captcha.error 
        format.html { redirect_to(:back, :notice => 'Поле номер обязательно для заполнения') }
        format.xml  { render :xml => @captcha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(@person, :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
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
