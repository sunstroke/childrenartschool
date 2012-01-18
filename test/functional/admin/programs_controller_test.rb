# -*- encoding : utf-8 -*-
require 'test_helper'

class Admin::ProgramsControllerTest < ActionController::TestCase
  setup do
    @admin_program = admin_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_program" do
    assert_difference('Admin::Program.count') do
      post :create, :admin_program => @admin_program.attributes
    end

    assert_redirected_to admin_program_path(assigns(:admin_program))
  end

  test "should show admin_program" do
    get :show, :id => @admin_program.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_program.to_param
    assert_response :success
  end

  test "should update admin_program" do
    put :update, :id => @admin_program.to_param, :admin_program => @admin_program.attributes
    assert_redirected_to admin_program_path(assigns(:admin_program))
  end

  test "should destroy admin_program" do
    assert_difference('Admin::Program.count', -1) do
      delete :destroy, :id => @admin_program.to_param
    end

    assert_redirected_to admin_programs_path
  end
end
