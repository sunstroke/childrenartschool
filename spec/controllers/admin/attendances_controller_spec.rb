require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::AttendancesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Admin::Attendance.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Admin::Attendance.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Admin::Attendance.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_attendance_url(assigns[:attendance]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Admin::Attendance.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Admin::Attendance.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Admin::Attendance.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Admin::Attendance.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Admin::Attendance.first
    response.should redirect_to(admin_attendance_url(assigns[:attendance]))
  end

  it "destroy action should destroy model and redirect to index action" do
    attendance = Admin::Attendance.first
    delete :destroy, :id => attendance
    response.should redirect_to(admin_attendances_url)
    Admin::Attendance.exists?(attendance.id).should be_false
  end
end
