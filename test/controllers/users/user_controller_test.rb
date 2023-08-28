require "test_helper"

class Users::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show　" do
    get users_user_show　_url
    assert_response :success
  end

  test "should get edit" do
    get users_user_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_user_update_url
    assert_response :success
  end

  test "should get confirm" do
    get users_user_confirm_url
    assert_response :success
  end
end
