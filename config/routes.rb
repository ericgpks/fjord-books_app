Rails.application.routes.draw do
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show edit update]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
