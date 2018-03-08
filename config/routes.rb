# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :commons, only: [], path: "/" do
      get :alive, on: :collection
    end
    namespace :v1 do
      resources :rooms, only: [:index]
    end
  end
end
