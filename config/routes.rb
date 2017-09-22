Rails.application.routes.draw do
  namespace :api do
    resources :commons, only: [], path: "/" do
      get :alive, on: :collection
    end
    namespace :v1 do
      resources :customers, only: [:index, :show, :create, :update, :destroy]
      resources :products, only: [:index, :show, :create, :update, :destroy]
      resources :units, only: :index
    end
  end
end
