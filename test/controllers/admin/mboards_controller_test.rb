require 'test_helper'

class Admin::MboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_mboard = admin_mboards(:one)
  end

  test "should get index" do
    get admin_mboards_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_mboard_url
    assert_response :success
  end

  test "should create admin_mboard" do
    assert_difference('Admin::Mboard.count') do
      post admin_mboards_url, params: { admin_mboard: {  } }
    end

    assert_redirected_to admin_mboard_url(Admin::Mboard.last)
  end

  test "should show admin_mboard" do
    get admin_mboard_url(@admin_mboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_mboard_url(@admin_mboard)
    assert_response :success
  end

  test "should update admin_mboard" do
    patch admin_mboard_url(@admin_mboard), params: { admin_mboard: {  } }
    assert_redirected_to admin_mboard_url(@admin_mboard)
  end

  test "should destroy admin_mboard" do
    assert_difference('Admin::Mboard.count', -1) do
      delete admin_mboard_url(@admin_mboard)
    end

    assert_redirected_to admin_mboards_url
  end
end
