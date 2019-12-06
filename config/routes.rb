Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1, format: :json do
      resources :visits, only: [:index]
      resources :students, only: [:index]
      resources :catalogue_locations, only: [:index]
    end
  end

  resources :visits, only: [:index, :show, :create, :update] do
    resource :report, only: [:new, :create, :edit], module: :visits
  end

  resources :request_visits, only: [:index, :show, :update]
  resource :report, only: [:show]
  resources :students, only: [:index, :show]
  resource :profile, only: [:show, :update] do
    resource :visits, module: :profiles, only: [:show]
    resources :students, module: :profiles, only: [:show, :update]
  end
  resource :user, only: [:update]
end
