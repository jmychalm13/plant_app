Rails.application.routes.draw do
  get "/user_plants" => "user_plants#index"

  post "/user_plants" => "user_plants#create"
end
