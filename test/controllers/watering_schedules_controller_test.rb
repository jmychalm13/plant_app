require "test_helper"

class WateringSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "Jane", last_name: "Smith", email: "jane@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {
      email: "jane@test.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/watering_schedules.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal WateringSchedule.count, data.length
  end

  test "show" do
    get "/watering_schedules/#{WateringSchedule.first.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal ["user_plant_id", "schedule"], data.keys
  end

  test "create" do
    assert_difference "WateringSchedule.count", 1 do
      post "/watering_schedules.json",
      params: {user_plant_id: UserPlant.first.id, schedule: "test schedule"}, headers: {
        "Authorization" => "Bearer #{@jwt}"
      }

      assert_response :success
    end
  end

  test "update" do
    watering_schedule = WateringSchedule.first
    patch "/watering_schedules/#{watering_schedule.id}.json", params: {
      schedule: "updated test schedule"
    }, headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal "updated test schedule", data["schedule"]
  end

  test "destroy" do
    assert_difference "WateringSchedule.count", -1 do
      delete "/watering_schedules/#{WateringSchedule.first.id}.json", headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response :success
    end
  end
end
