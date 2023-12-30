require "test_helper"

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(first_name: "Dan", last_name: "Ford", email: "dan@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {
      email: "dan@test.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/types.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Type.count, data.length
  end

  test "show" do
    get "/types/#{Type.first.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal ["type_name"], data.keys
  end

  test "create" do
    assert_difference "Type.count", 1 do
      post "/types.json", params: {
        type_name: "Test Type"
      }, headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response :success
    end
  end

  test "update" do
    type = Type.create(type_name: "test type")
    patch "/types/#{type.id}.json", params: {
      type_name: "updated type"
    }, headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal "updated type", data["type_name"]
  end
  
  test "destroy" do
    assert_difference "Type.count", -1 do
      delete "/types/#{Type.first.id}.json", headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response :success
    end
  end
end
