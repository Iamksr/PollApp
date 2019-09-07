require 'test_helper'

class MyoptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myoption = myoptions(:one)
  end

  test "should get index" do
    get myoptions_url
    assert_response :success
  end

  test "should get new" do
    get new_myoption_url
    assert_response :success
  end

  test "should create myoption" do
    assert_difference('Myoption.count') do
      post myoptions_url, params: { myoption: { poll_id: @myoption.poll_id, title: @myoption.title, user_id: @myoption.user_id } }
    end

    assert_redirected_to myoption_url(Myoption.last)
  end

  test "should show myoption" do
    get myoption_url(@myoption)
    assert_response :success
  end

  test "should get edit" do
    get edit_myoption_url(@myoption)
    assert_response :success
  end

  test "should update myoption" do
    patch myoption_url(@myoption), params: { myoption: { poll_id: @myoption.poll_id, title: @myoption.title, user_id: @myoption.user_id } }
    assert_redirected_to myoption_url(@myoption)
  end

  test "should destroy myoption" do
    assert_difference('Myoption.count', -1) do
      delete myoption_url(@myoption)
    end

    assert_redirected_to myoptions_url
  end
end
