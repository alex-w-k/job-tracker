Rails.application.routes.draw do
  root to: 'companies#index'
  resources :categories
  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

end
