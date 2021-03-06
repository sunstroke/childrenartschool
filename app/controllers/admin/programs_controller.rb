# -*- encoding : utf-8 -*-
class Admin::ProgramsController < ApplicationController
  before_filter :require_login
  # GET /admin/programs
  # GET /admin/programs.xml
 layout'admin'  
  def index
    @programs = Program.find(:all,:order=>["program_type ASC, position ASC"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  # GET /admin/programs/1
  # GET /admin/programs/1.xml
  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /admin/programs/new
  # GET /admin/programs/new.xml
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /admin/programs/1/edit
  def edit
    @program = Program.find(params[:id])
  end

  # POST /admin/programs
  # POST /admin/programs.xml
  def create
    @program = Program.new(params[:program])

    respond_to do |format|
      if @program.save
        format.html { redirect_to(admin_program_path(@program), :notice => 'Program was successfully created.') }
        format.xml  { render :xml => @program, :status => :created, :location => @program }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/programs/1
  # PUT /admin/programs/1.xml
  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { redirect_to(admin_program_path(@program), :notice => 'Program was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/programs/1
  # DELETE /admin/programs/1.xml
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to(admin_programs_url) }
      format.xml  { head :ok }
    end
  end
end
