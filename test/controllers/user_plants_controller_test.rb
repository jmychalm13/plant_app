require "test_helper"

class UserPlantsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/user_plants.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal UserPlant.count, data.length
  end

  test "create" do
    assert_difference "UserPlant.count", 1 do
      post "/user_plants.json", params: {first_name: "Jane", last_name: "Test", email: "jane@test.com", password: "password", password_confirmation: "password"}
      assert_response 200
    end
  end
end
