Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "search#show"
        get "/find_all", to: 'search#index'

        get "/most_revenue", to: 'most_revenue#index'
        get "/most_items", to: 'most_items#index'
      end
      resources :merchants, except: [:edit, :new] do
          resources :items, only: [:index], controller: 'merchant_items'
      end
      resources :items, except: [:edit, :new] do
          resources :merchant, only: [:index], controller: 'item_merchant'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
