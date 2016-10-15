require 'test_helper'

class Admin::RepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_reply = admin_replies(:one)
  end

  test "should get index" do
    get admin_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_reply_url
    assert_response :success
  end

  test "should create admin_reply" do
    assert_difference('Admin::Reply.count') do
      post admin_replies_url, params: { admin_reply: {  } }
    end

    assert_redirected_to admin_reply_url(Admin::Reply.last)
  end

  test "should show admin_reply" do
    get admin_reply_url(@admin_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_reply_url(@admin_reply)
    assert_response :success
  end

  test "should update admin_reply" do
    patch admin_reply_url(@admin_reply), params: { admin_reply: {  } }
    assert_redirected_to admin_reply_url(@admin_reply)
  end

  test "should destroy admin_reply" do
    assert_difference('Admin::Reply.count', -1) do
      delete admin_reply_url(@admin_reply)
    end

    assert_redirected_to admin_replies_url
  end
end
