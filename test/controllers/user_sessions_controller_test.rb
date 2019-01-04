require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get user_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_sessions_destroy_url
    assert_response :success
  end

  test "should get user_session_params" do
    get user_sessions_user_session_params_url
    assert_response :success
  end

end
