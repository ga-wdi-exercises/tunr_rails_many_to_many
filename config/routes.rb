Rails.application.routes.draw do
  devise_for :users
  root to: 'artists#index'

  resources :artists do
    resources :songs, except: [:index, :show]
  end

  resources :songs, only: [:index, :show] do
    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
  end
end
