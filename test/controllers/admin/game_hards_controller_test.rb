require "test_helper"

class Admin::GameHardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_game_hards_index_url
    assert_response :success
  end
end
