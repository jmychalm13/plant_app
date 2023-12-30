require "test_helper"

class ZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "John", last_name: "Smith", email: "john@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {
      email: "john@test.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/zones.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Zone.count, data.length
  end
  
  test "create" do
    assert_difference "Zone.count", 1 do
      post "/zones.json", params: {
        user_id: User.first.id,
        location_name: "den",
        light_level: "medium"
      },
      headers: {
        "Authorization" => "Bearer #{@jwt}",
      }
      assert_response :success
    end
  end

end
