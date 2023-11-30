class DetailsController < ApplicationController
  require 'uri'
  require 'net/http'

  def show
    plant = params[:name]
    url = URI("https://house-plants2.p.rapidapi.com/search?query=#{plant}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = Rails.application.credentials.plant_app_api[:api_key]
    request["X-RapidAPI-Host"] = 'house-plants2.p.rapidapi.com'

    response = http.request(request)
    json_data = response.read_body

    parsed_data = JSON.parse(json_data)

    render json: parsed_data
  end

end
