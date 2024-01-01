require "test_helper"
require 'webmock/minitest'
WebMock.disable_net_connect!(allow: 'houseplants1.p.rapidapi.com')

class DetailsControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    post "/details.json", params: {
      name: "monstera"
    }

    assert_response 200
    data = JSON.parse(response.body)
    assert_equal(["Id", "Name", "Image", "LifeForm", "Family", "Origin", "EaseOfCultivation", "Size", "GrowthRate", "Lifespan", "Temperature", "Humidity", "Lighting", "Soil", "Watering", "Fertilizer", "Reproduction", "Bloom", "Transfer", "Care", "Difficulties", "AirCleaning", "Toxicity"], data.keys)
  end
end
