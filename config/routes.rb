Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/user_plants" => "user_plants#index"

  post "/user_plants" => "user_plants#create"

  get "/user_plants/:id" => "user_plants#show"

  patch "/user_plants/:id" => "user_plants#update"

  delete "/user_plants/:id" => "user_plants#destroy"

  get "/care_instructions/:id" => "care_instructions#show"

  get "/cuttings" => "cuttings#index"

  get "/types" => "types#index"

  post "/types" => "types#create"

  patch "/types/:id" => "types#update"

  get "/types/:id" => "types#show"

  delete "/types/:id" => "types#destroy"

  post "/watering_schedules" => "watering_schedules#create"
end
