require 'test_helper'

class MboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mboard_index_url
    assert_response :success
  end

  test "should get new" do
    get mboard_new_url
    assert_response :success
  end

end
