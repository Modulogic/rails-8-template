Rails.application.routes.draw do
  # Main page shows the list of videos
  root "videos#index"

  # RESTful routes for videos
  resources :videos, only: [:index, :show, :new, :create]
end
