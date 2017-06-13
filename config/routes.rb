Rails.application.routes.draw do
  root to: 'companies#index'
  resources :companies do
    resources :jobs
  end
end
