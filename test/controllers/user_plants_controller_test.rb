require "test_helper"

class UserPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "Jane", last_name: "Smith", email: "jane@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {email: "jane@test.com", password: "password"}
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

  test "create" do
    assert_difference "UserPlant.count", 1 do
      post "/user_plants.json", params: {
        zone_id: 1,
        type_id: 1,
        img_url: "test.jpg",
        type_name: "Test Type"
      },
      headers: { "Authorization" => "Bearer #{@jwt}" }
      
      assert_response :success
    end

  end
end
