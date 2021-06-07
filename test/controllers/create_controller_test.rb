require 'test_helper'

class CreateControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get create_destroy_url
    assert_response :success
  end

  test "should get followings" do
    get create_followings_url
    assert_response :success
  end

  test "should get followers" do
    get create_followers_url
    assert_response :success
  end

end
