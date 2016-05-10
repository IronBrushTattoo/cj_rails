Rails.application.routes.draw do
  resources :labelsheets, :except => [:show]
  resources :labelsheets, :only => [:show], :defaults => { :format => 'pdf' }

  get "labelsheets" => "labelsheets#new"
  get "labelsheets/:id", to: "labelsheets#show", defaults: { format: 'pdf' }

  constraints format: 'pdf' do
    resources :labelsheets, only: [:show]
  end
  
  get 'dashboard/show'

  get "/" => "home#show"

  get "/dashboard" => "dashboard#show"

  get "/callback" => "auth0#callback"
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
end
