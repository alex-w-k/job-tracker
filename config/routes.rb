Rails.application.routes.draw do
  root 'dashboard#index'

  get 'dashboard', to: "dashboard#index"

  resources :categories

  resources :companies do
    resources :jobs do
      resources :comments
    end

    resources :contacts
  end

end
