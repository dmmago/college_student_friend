require "test_helper"

class Public::LecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_lectures_show_url
    assert_response :success
  end

  test "should get index" do
    get public_lectures_index_url
    assert_response :success
  end
end
