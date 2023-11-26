class CareInstructionsController < ApplicationController
  require 'uri'
  require 'net/http'
  
  def show
  plant = UserPlant.find(params[:id])
    url = URI("https://house-plants2.p.rapidapi.com/search?query=#{plant.name}")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = Rails.application.credentials.plant_app_api[:api_key]
    request["X-RapidAPI-Host"] = 'house-plants2.p.rapidapi.com'
    
    response = http.request(request)
    json_data = response.read_body

    @parsed_data = JSON.parse(json_data)

    # Creating recommendation object to be returned to frontend containing light and water requirements
    recommendation = CareInstruction.create(
      user_plant_id: plant.id,
      instructions: "This plants does best with #{@parsed_data[0]["item"]["Light ideal"]} and #{@parsed_data[0]["item"]["Watering"]} water"
    )


    render json: recommendation
    # render json: @parsed_data
  end
end
