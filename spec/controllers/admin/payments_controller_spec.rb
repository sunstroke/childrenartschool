require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PaymentsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Admin::Payment.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Admin::Payment.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Admin::Payment.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_payment_url(assigns[:payment]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Admin::Payment.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Admin::Payment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Admin::Payment.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Admin::Payment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Admin::Payment.first
    response.should redirect_to(admin_payment_url(assigns[:payment]))
  end

  it "destroy action should destroy model and redirect to index action" do
    payment = Admin::Payment.first
    delete :destroy, :id => payment
    response.should redirect_to(admin_payments_url)
    Admin::Payment.exists?(payment.id).should be_false
  end
end
