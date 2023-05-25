Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :movies, only

  root 'lists#index'

  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: :create
  end

  resources :bookmarks, only: :destroy
end
