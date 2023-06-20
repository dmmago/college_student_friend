require "test_helper"

class Public::SeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_seats_index_url
    assert_response :success
  end

  test "should get show" do
    get public_seats_show_url
    assert_response :success
  end
end
