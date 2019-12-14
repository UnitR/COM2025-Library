require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  include ActionMailer::TestHelper
  
  test "should get index" do
    get contact_index_url
    assert_response :success
  end

  test "request" do
    # Create the email and store it for further assertions
    email = ContactMailer.form_email('test message', 'Angel Peltekov', 'ap01249@surrey.ac.uk')
 
    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end
 
    # Test the body of the sent email contains what we expect it to
    assert_equal ['best_books@surrey.ac.uk'], email.from
    assert_equal ['ap01249@surrey.ac.uk'], email.to
    assert_equal 'Support request', email.subject
  end

end
