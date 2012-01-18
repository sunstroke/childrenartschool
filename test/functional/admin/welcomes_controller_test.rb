# -*- encoding : utf-8 -*-
require 'test_helper'

class Admin::WelcomesControllerTest < ActionController::TestCase
  setup do
    @admin_welcome = admin_welcomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_welcomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_welcome" do
    assert_difference('Admin::Welcome.count') do
      post :create, :admin_welcome => @admin_welcome.attributes
    end

    assert_redirected_to admin_welcome_path(assigns(:admin_welcome))
  end

  test "should show admin_welcome" do
    get :show, :id => @admin_welcome.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_welcome.to_param
    assert_response :success
  end

  test "should update admin_welcome" do
    put :update, :id => @admin_welcome.to_param, :admin_welcome => @admin_welcome.attributes
    assert_redirected_to admin_welcome_path(assigns(:admin_welcome))
  end

  test "should destroy admin_welcome" do
    assert_difference('Admin::Welcome.count', -1) do
      delete :destroy, :id => @admin_welcome.to_param
    end

    assert_redirected_to admin_welcomes_path
  end
end
