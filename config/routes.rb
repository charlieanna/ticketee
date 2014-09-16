Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects do
    resources :tickets
  end
  resources :users
  resource :session
end
