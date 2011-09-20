class Admin::PeopleController < ApplicationController
  # GET /admin/people
  # GET /admin/people.xml
 layout'admin'  
  def index
    @people = Person.find(:all, :order=>["current_group ASC"], :conditions=>["failure = ? OR failure = ? ",false, nil])
    @count=@people.count
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end
  def archive
    @people = Person.find(:all, :order=>["current_group ASC"],:conditions=>["failure = ?",true])
    @count=@people.count
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  def subscribe
    @people = Person.find(:all, :order=>["current_group ASC"], :conditions=>["(sub_group = ? OR sub_all = ?) AND mail > ? ",true,true,""])
    @count=@people.count
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /admin/people/1
  # GET /admin/people/1.xml
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /admin/people/new
  # GET /admin/people/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /admin/people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /admin/people
  # POST /admin/people.xml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(admin_person_path(@person), :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/people/1
  # PUT /admin/people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(admin_person_path(@person), :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/people/1
  # DELETE /admin/people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(admin_people_url) }
      format.xml  { head :ok }
    end
  end
end
