Rails.application.routes.draw do
  root to: 'artists#index'
  get '/songs', to: 'songs#index'
  resources :artists do
    resources :songs
    resources :genres
  end
end
