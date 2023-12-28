require "test_helper"
require 'webmock/minitest'
WebMock.disable_net_connect!(allow: 'houseplants1.p.rapidapi.com')

class DetailsControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    post "/details.json", params: {
      name: "monstera"
    }

    assert_response :success
  end
end
