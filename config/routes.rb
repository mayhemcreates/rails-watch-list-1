Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "lists#index"
  resources :lists, only: [:show, :edit, :new, :create] do
    resources :movies, only: [:show]
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: [:index]
end
