Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  post '/follow', to: 'users#follow'
  get '/users/:id/followings', to: 'users#followings'
end
