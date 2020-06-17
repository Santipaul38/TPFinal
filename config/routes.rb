Rails.application.routes.draw do
  resources :games
  resources :types
  resources :maps
  get 'game/index'
  devise_for :users
  resources :ships
  get 'games/play'
  
  
  devise_scope :user do
    authenticated :user do
      root "ships#new"
      #root "devise/sessions#destroy"
    end

    unauthenticated :user do
      root "devise/sessions#new", as: :user_unregistered
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
end
