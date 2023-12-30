require "test_helper"

class FertilizerSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "Mary Jane", last_name: "Moore", email: "maryjane@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {
      email: "maryjane@test.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/fertilizer_schedules.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal FertilizerSchedule.count, data.length
  end

  test "show" do
    get "/fertilizer_schedules/#{FertilizerSchedule.first.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal ["user_plant_id", "schedule"], data.keys
  end

  test "create" do
    assert_difference "FertilizerSchedule.count", 1 do
      post "/fertilizer_schedules.json", params: {
        user_plant_id: UserPlant.first.id,
        schedule: "This is a test schedule."
      }, headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response :success
    end
  end

  test "update" do
    fertilizer_schedule = FertilizerSchedule.first
    patch "/fertilizer_schedules/#{fertilizer_schedule.id}.json", params: {
      schedule: "This is an updated test schedule"
    }, headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response :success
  end

  test "destroy" do
    assert_difference "FertilizerSchedule.count", -1 do
      delete "/fertilizer_schedules/#{FertilizerSchedule.first.id}.json", headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response :success
    end
  end
end
