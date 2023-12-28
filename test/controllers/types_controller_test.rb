require "test_helper"

class TypesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/types.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Type.count, data.length
  end
end
