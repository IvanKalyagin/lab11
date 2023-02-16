require "test_helper"

class Lab11ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lab11_input_url
    assert_response :success
  end

  test "should get view" do
    get lab11_view_url
    assert_response :success
  end
end
