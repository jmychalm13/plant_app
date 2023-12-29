require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: {
        first_name: "John",
        last_name: "Smith",
        email: "john@test.com",
        password: "password"
      }
      assert_response 201
    end
  end
end
