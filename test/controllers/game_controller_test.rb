require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get [play]" do
    get game_[play]_url
    assert_response :success
  end

end
