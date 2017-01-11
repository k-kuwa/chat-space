Rails.application.routes.draw do

  devise_for :users
  root 'groups#index'
  resources :groups, only: %i(index new create edit update) do
    collection do
      get 'search', action: :search
    end
    resources :messages, only: %i(index create)
  end

end
