Rails.application.routes.draw do

  devise_for :users
  root 'groups#index'
  resources :groups, only: %i(new create show edit update)

end
