Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/user_plants" => "user_plants#index"

  post "/user_plants" => "user_plants#create"

  get "/user_plants/:id" => "user_plants#show"

  patch "/user_plants/:id" => "user_plants#update"

  delete "/user_plants/:id" => "user_plants#destroy"

  get "/care_instructions" => "care_instructions#index"
end
