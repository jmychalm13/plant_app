require "test_helper"

class CuttingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "Jane", last_name: "Smith", email: "jane@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {email: "jane@test.com", password: "password"}
    Zone.create(user_id: User.first.id, location_name: "den", light_level: "high")
    Type.create(type_name: "test type")
    UserPlant.create(user_id: User.first.id, zone_id: Zone.first.id, type_id: Type.first.id, img_url: "test.jpg", name: "test plant")
  end

  test "index" do
    get "/cuttings.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Cutting.count, data.length
  end

  test "create" do
    assert_difference "Cutting.count", 1 do
      post "/cuttings.json", params: {
        user_plant_id: UserPlant.first.id,
        zone_id: Zone.first.id,
        roots: true,
        date_cut: "2023-12-28"
      }

      assert_response :success
    end
  end

  # test "show" do
  #   get "/cuttings/#{Cutting.first.id}.json"
  #   assert_response :success

  #   data = JSON.parse(response.body)
  #   assert_equal ["user_plant_id", "zone_id", "roots", "date_cut"], data.keys
  # end
end
