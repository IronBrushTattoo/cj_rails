Rails.application.routes.draw do
  #resources :spreadsheets
  #get "spreadsheets" => "spreadsheets#new"
  resources :labelsheets
  get "labelsheets" => "labelsheets#new"

  get 'dashboard/show'

  get "/" => "home#show"

  get "/dashboard" => "dashboard#show"

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
end
