require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get home" do
    sign_in users(:one)
    get root_url
    assert_response :success

    assert_select 'title', 'MusicLibrary'
    assert_select 'h1', 'MusicLibrary'
    assert_select 'p', 'Welcome to MusicLibrary, A web app which can be used to store and organise all your favourite tunes.'
  end

  test "should get contact" do
    sign_in users(:one)
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'MusicLibrary'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Kindly, complete the form to get in touch with us. We hope to reply as soon as possible.'
  end

  test "should post request contact but no email" do
    sign_in users(:one)
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    sign_in users(:one)
    post request_contact_url, params: {name: "Funbi", email: "funbi.o@yahoo.co.uk", telephone: "1234567890", message: "Hello"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end



end
