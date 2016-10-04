require 'test_helper'

class GuestbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guestbooks_index_url
    assert_response :success
  end

end
