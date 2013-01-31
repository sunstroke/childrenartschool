require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::RecordBooksController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Admin::RecordBook.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Admin::RecordBook.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Admin::RecordBook.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_record_book_url(assigns[:record_book]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Admin::RecordBook.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Admin::RecordBook.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Admin::RecordBook.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Admin::RecordBook.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Admin::RecordBook.first
    response.should redirect_to(admin_record_book_url(assigns[:record_book]))
  end

  it "destroy action should destroy model and redirect to index action" do
    record_book = Admin::RecordBook.first
    delete :destroy, :id => record_book
    response.should redirect_to(admin_record_books_url)
    Admin::RecordBook.exists?(record_book.id).should be_false
  end
end
