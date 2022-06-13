Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      get 'backgrounds', to: 'backgrounds#show'
      get 'book-search', to: 'booksearch#index'
#      resources :backgrounds, only: [:index]
    end
  end
end
