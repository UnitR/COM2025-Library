require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_index_url
    assert_response :success
  end

  test "should get send_request" do
    get contact_send_request_url
    assert_response :success
  end

end
