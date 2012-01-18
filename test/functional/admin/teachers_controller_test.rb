# -*- encoding : utf-8 -*-
require 'test_helper'

class Admin::TeachersControllerTest < ActionController::TestCase
  setup do
    @admin_teacher = admin_teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_teacher" do
    assert_difference('Admin::Teacher.count') do
      post :create, :admin_teacher => @admin_teacher.attributes
    end

    assert_redirected_to admin_teacher_path(assigns(:admin_teacher))
  end

  test "should show admin_teacher" do
    get :show, :id => @admin_teacher.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_teacher.to_param
    assert_response :success
  end

  test "should update admin_teacher" do
    put :update, :id => @admin_teacher.to_param, :admin_teacher => @admin_teacher.attributes
    assert_redirected_to admin_teacher_path(assigns(:admin_teacher))
  end

  test "should destroy admin_teacher" do
    assert_difference('Admin::Teacher.count', -1) do
      delete :destroy, :id => @admin_teacher.to_param
    end

    assert_redirected_to admin_teachers_path
  end
end
