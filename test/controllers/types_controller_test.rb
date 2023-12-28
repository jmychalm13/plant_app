require "test_helper"

class TypesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/types.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Type.count, data.length
  end

  test "show" do
    get "/types/#{Type.first.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal ["type_name"], data.keys
  end
end
