Rails.application.routes.draw do
  namespace :v1 do
    resources :books
    delete "book/unpublish/:id" => "books#unpublish"
    get "book/search" => "books#search"
    resources :users
  end
  resources :roles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
