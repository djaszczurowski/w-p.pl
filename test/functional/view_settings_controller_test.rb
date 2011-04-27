require 'test_helper'

class ViewSettingsControllerTest < ActionController::TestCase
  setup do
    @view_setting = view_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:view_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create view_setting" do
    assert_difference('ViewSetting.count') do
      post :create, :view_setting => @view_setting.attributes
    end

    assert_redirected_to view_setting_path(assigns(:view_setting))
  end

  test "should show view_setting" do
    get :show, :id => @view_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @view_setting.to_param
    assert_response :success
  end

  test "should update view_setting" do
    put :update, :id => @view_setting.to_param, :view_setting => @view_setting.attributes
    assert_redirected_to view_setting_path(assigns(:view_setting))
  end

  test "should destroy view_setting" do
    assert_difference('ViewSetting.count', -1) do
      delete :destroy, :id => @view_setting.to_param
    end

    assert_redirected_to view_settings_path
  end
end
