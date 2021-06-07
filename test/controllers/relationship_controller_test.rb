require 'test_helper'

class RelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relationship_create_url
    assert_response :success
  end

  test "should get destroy" do
    get relationship_destroy_url
    assert_response :success
  end

  test "should get followings" do
    get relationship_followings_url
    assert_response :success
  end

  test "should get followers" do
    get relationship_followers_url
    assert_response :success
  end

end
