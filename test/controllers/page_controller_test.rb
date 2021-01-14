require "test_helper"

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page_index_url
    assert_response :success
  end

  test "should get help" do
    get page_help_url
    assert_response :success
  end
end
