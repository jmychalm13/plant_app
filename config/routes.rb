Rails.application.routes.draw do
  get "/user_plants" => "user_plants#index"

  post "/user_plants" => "user_plants#create"

  get "/user_plants/:id" => "user_plants#show"
end
