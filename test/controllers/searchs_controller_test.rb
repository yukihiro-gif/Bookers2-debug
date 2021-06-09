require 'test_helper'

class SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get serch" do
    get searchs_serch_url
    assert_response :success
  end

end
