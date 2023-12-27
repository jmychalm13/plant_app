require "test_helper"

class UserPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "John", last_name: "Smith", email: "john@test.com", password: "password", password_confirmation: "password")
    post "http://localhost:3000/sessions.json", params: {email: "john@test.com", password: "password"}
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/user_plants.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal UserPlant.count, data.length
  end

  test "create" do
    assert_difference "UserPlant.count", 1 do
      post "/user_plants.json", params: {user_id: 1, plant_id: 1, zone_id: 1, type_id: 1, img_url: "test.jpg"},
      headers: {"Authorization" => "Bearer #{@jwt}"}
      assert_response 200
    end
  end
end
