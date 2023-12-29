require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/users.json", params: {
      first_name: "John",
      last_name: "Smith",
      email: "john@test.com",
      password: "password",
      password_confirmation: "password"
    }

    post "/sessions.json", params: {
      email: "john@test.com",
      password: "password"
    }
    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["jwt", "email", "user_id"], data.keys
  end
end
