require "test_helper"

class User::GameHardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_game_hards_index_url
    assert_response :success
  end
end
