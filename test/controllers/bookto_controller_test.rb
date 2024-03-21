require "test_helper"

class BooktoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookto_new_url
    assert_response :success
  end

  test "should get index" do
    get bookto_index_url
    assert_response :success
  end

  test "should get show" do
    get bookto_show_url
    assert_response :success
  end
end
