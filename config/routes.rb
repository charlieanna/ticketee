Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root :to => "base#index"
  end

  root to: 'projects#index'
  resources :projects do
    resources :tickets
  end
  resources :users
  resource :session
end
