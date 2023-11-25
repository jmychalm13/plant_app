class CareInstructionsController < ApplicationController
  require 'uri'
  require 'net/http'
  
  def show
  plant = UserPlant.find(params[:id]).name
    url = URI("https://house-plants2.p.rapidapi.com/search?query=#{plant}")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = Rails.application.credentials.plant_app_api[:api_key]
    request["X-RapidAPI-Host"] = 'house-plants2.p.rapidapi.com'
    
    response = http.request(request)
    json_data = response.read_body

    parsed_data = JSON.parse(json_data)

    watering_instructions = []
    parsed_data.each do |object|
      watering_instructions << object["item"]["Watering"]
    end

    pp watering_instructions

    render json: parsed_data
  end
end
