Rails.application.routes.draw do

  namespace :v1 do
    resources :books
    delete "book/unpublish/:id" => "books#unpublish"
    scope '/book' do
      get "search" => "books#search"
      post "import" => "books#import"
    end

  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'}

end
