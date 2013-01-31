class Admin::LessonsLogsController < ApplicationController
  def index
    @lessons_logs = LessonsLog.all
  end

  def show
    @lessons_log = LessonsLog.find(params[:id])
  end

  def new
    @lessons_log = LessonsLog.new
  end

  def create
    @lessons_log = LessonsLog.new(params[:lessons_log])
    if @lessons_log.save
      redirect_to @lessons_log, :notice => "Successfully created admin/lessons log."
    else
      render :action => 'new'
    end
  end

  def edit
    @lessons_log = LessonsLog.find(params[:id])
  end

  def update
    @lessons_log = LessonsLog.find(params[:id])
    if @lessons_log.update_attributes(params[:lessons_log])
      redirect_to @lessons_log, :notice  => "Successfully updated admin/lessons log."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @lessons_log = LessonsLog.find(params[:id])
    @lessons_log.destroy
    redirect_to admin_lessons_logs_url, :notice => "Successfully destroyed admin/lessons log."
  end
end
