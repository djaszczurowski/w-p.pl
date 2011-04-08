require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get news_managment" do
    get :news_managment
    assert_response :success
  end

  test "should get users_managment" do
    get :users_managment
    assert_response :success
  end

  test "should get postulates_managment" do
    get :postulates_managment
    assert_response :success
  end

end
