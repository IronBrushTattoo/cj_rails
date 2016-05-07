Rails.application.routes.draw do
  root 'spreadsheets#new'

  resources :spreadsheets

  get "spreadsheets" => "spreadsheets#new"
end
