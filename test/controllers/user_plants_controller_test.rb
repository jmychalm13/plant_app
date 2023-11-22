require "test_helper"

class UserPlantsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/user_plants.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal UserPlant.count, data.length
  end
end
