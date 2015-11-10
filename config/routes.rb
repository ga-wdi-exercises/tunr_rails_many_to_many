Rails.application.routes.draw do
  devise_for :users
  root to: 'artists#index'
  get '/songs', to: 'songs#index'
  resources :artists do
    resources :songs
    resources :genres
  end

  resources :songs do
    member do
      post 'add_favorite'
      post 'remove_favorite'
    end
  end
end
