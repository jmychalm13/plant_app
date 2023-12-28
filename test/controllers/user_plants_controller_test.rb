require "test_helper"

class UserPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "Jane", last_name: "Smith", email: "jane@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {email: "jane@test.com", password: "password"}
    Type.create(type_name: "Test Type")
    Zone.create(user_id: User.first, location_name: "Den", light_level: "high")
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  teardown do
    # Optionally clean up created data after each test
    @user.destroy if @user
    # Additional cleanup if necessary
  end

  test "index" do
    get "/user_plants.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal UserPlant.count, data.length
  end

  test "show" do
    get "/user_plants/#{UserPlant.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "type_name", "name", "watering_schedules", "fertilizer_schedules", "care_instructions", "img_url", "created_at", "updated_at", "zone_name"], data.keys
  end

  test "create" do
    assert_difference "UserPlant.count", 1 do
      post "/user_plants.json",
        params: {
          zone_id: Zone.first.id,
          type_id: Type.first.id,
          img_url: "test.jpg",
          name: "Test Plant"
        },
        headers: {
          "Authorization" => "Bearer #{@jwt}",
        }
      
      assert_response :success
    end
  end
end
