require 'test_helper'

class LabelsheetsControllerTest < ActionController::TestCase
  setup do
    @labelsheet = labelsheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labelsheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create labelsheet" do
    assert_difference('Labelsheet.count') do
      post :create, labelsheet: { days: @labelsheet.days, file_name: @labelsheet.file_name, file_uid: @labelsheet.file_uid }
    end

    assert_redirected_to labelsheet_path(assigns(:labelsheet))
  end

  test "should show labelsheet" do
    get :show, id: @labelsheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @labelsheet
    assert_response :success
  end

  test "should update labelsheet" do
    patch :update, id: @labelsheet, labelsheet: { days: @labelsheet.days, file_name: @labelsheet.file_name, file_uid: @labelsheet.file_uid }
    assert_redirected_to labelsheet_path(assigns(:labelsheet))
  end

  test "should destroy labelsheet" do
    assert_difference('Labelsheet.count', -1) do
      delete :destroy, id: @labelsheet
    end

    assert_redirected_to labelsheets_path
  end
end
