class DetailsController < ApplicationController

  def show
    plant = params[:name]

    url = URI("https://houseplants1.p.rapidapi.com/api/v1/houseplant/#{plant}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = Rails.application.credentials.plant_app_api.api_key
    request["X-RapidAPI-Host"] = 'houseplants1.p.rapidapi.com'

    response = http.request(request)
    render json: response.read_body
  end

end
