require "test_helper"

class FertilizerSchedulesControllerTest < ActionDispatch::IntegrationTest
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
      }
      assert_response :success
    end
  end

  test "update" do
    fertilizer_schedule = FertilizerSchedule.first
    patch "/fertilizer_schedules/#{fertilizer_schedule.id}.json", params: {
      schedule: "This is an updated test schedule"
    }
    assert_response :success
  end

  test "destroy" do
    assert_difference "FertilizerSchedule.count", -1 do
      delete "/fertilizer_schedules/#{FertilizerSchedule.first.id}.json"
      assert_response :success
    end
  end
end
