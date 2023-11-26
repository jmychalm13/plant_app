require "test_helper"

class CuttingsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/cuttings.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Cutting.count, data.length
  end
end
