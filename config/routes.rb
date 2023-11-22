Rails.application.routes.draw do
  get "/user_plants" => "user_plants#index"

  post "/user_plants" => "user_plants#create"

  get "/user_plants/:id" => "user_plants#show"

  patch "/user_plants/:id" => "user_plants#update"

  delete "/user_plants/:id" => "user_plants#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end
