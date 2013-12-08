# -*- encoding : utf-8 -*-
class Admin::TeachersController < ApplicationController
   before_filter :require_login
  # GET /admin/teachers
  # GET /admin/teachers.xml
 layout'admin'  
  def index

    @teachers = Teacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teachers }
    end
  end

  # GET /admin/teachers/1
  # GET /admin/teachers/1.xml
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /admin/teachers/new
  # GET /admin/teachers/new.xml
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /admin/teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /admin/teachers
  # POST /admin/teachers.xml
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to(admin_teacher_path(@teacher), :notice => 'Teacher was successfully created.') }
        format.xml  { render :xml => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/teachers/1
  # PUT /admin/teachers/1.xml
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to(admin_teacher_path(@teacher), :notice => 'Teacher was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/teachers/1
  # DELETE /admin/teachers/1.xml
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to(admin_teachers_url) }
      format.xml  { head :ok }
    end
  end
end
