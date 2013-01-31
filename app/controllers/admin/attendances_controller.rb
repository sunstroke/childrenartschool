class Admin::AttendancesController < ApplicationController
  before_filter :require_login
   layout'admin'
  
  def index
    @attendances = Attendance.all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(params[:attendance])
    if @attendance.save
      redirect_to @attendance, :notice => "Successfully created admin/attendance."
    else
      render :action => 'new'
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update_attributes(params[:attendance])
      redirect_to @attendance, :notice  => "Successfully updated admin/attendance."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to admin_attendances_url, :notice => "Successfully destroyed admin/attendance."
  end
end
