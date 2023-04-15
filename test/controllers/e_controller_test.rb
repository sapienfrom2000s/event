require "test_helper"

class EControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get e_index_url
    assert_response :success
  end
end
