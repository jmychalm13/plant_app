class CareInstructionsController < ApplicationController
  def index
    require 'uri'
    require 'net/http'

    plant = UserPlant.first().name
    
    url = URI("https://house-plants2.p.rapidapi.com/search?query=#{plant}")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = Rails.application.credentials.plant_app_api[:api_key]
    request["X-RapidAPI-Host"] = 'house-plants2.p.rapidapi.com'
    
    response = http.request(request)
    render json: response.read_body    
  end
end
