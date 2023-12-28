require "test_helper"

class WateringSchedulesControllerTest < ActionDispatch::IntegrationTest
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
end
