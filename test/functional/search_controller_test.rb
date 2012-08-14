require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get hot_search" do
    get :hot_search
    assert_response :success
  end

end
