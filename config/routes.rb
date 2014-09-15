Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects,only: [:index, :new, :create, :show, :edit, :update,:destroy]
end
