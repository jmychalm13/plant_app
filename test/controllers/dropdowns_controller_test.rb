require "test_helper"

class DropdownsControllerTest < ActionDispatch::IntegrationTest

  test "type" do
    get "/dropdowns/type.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Type.count, data.length
  end

  test "zone" do
    get "/dropdowns/zone.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Zone.count, data.length
  end

  test "plant" do
    get "/dropdowns/plant.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal UserPlant.count, data.length
  end
end
