require 'test_helper'

class ContactSettingsControllerTest < ActionController::TestCase
  setup do
    @contact_setting = contact_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_setting" do
    assert_difference('ContactSetting.count') do
      post :create, :contact_setting => @contact_setting.attributes
    end

    assert_redirected_to contact_setting_path(assigns(:contact_setting))
  end

  test "should show contact_setting" do
    get :show, :id => @contact_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contact_setting.to_param
    assert_response :success
  end

  test "should update contact_setting" do
    put :update, :id => @contact_setting.to_param, :contact_setting => @contact_setting.attributes
    assert_redirected_to contact_setting_path(assigns(:contact_setting))
  end

  test "should destroy contact_setting" do
    assert_difference('ContactSetting.count', -1) do
      delete :destroy, :id => @contact_setting.to_param
    end

    assert_redirected_to contact_settings_path
  end
end
