Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'orders/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'orders/show'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show, :create]
      resources :orders, only: [:index, :show]
    end
  end

end
