Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  resources :user_plants

  get "/care_instructions" => "care_instructions#index"

  get "/care_instructions/:id" => "care_instructions#create"

  resources :cuttings

  resources :types

  resources :watering_schedules

  resources :fertilizer_schedules

  resources :zones

  post "/details" => "details#show"

  get "/dropdowns/type" => "dropdowns#type" 

  get "/dropdowns/zone" => "dropdowns#zone"

  get "/dropdowns/plant" => "dropdowns#plant"
end
