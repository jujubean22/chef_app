Rails.application.routes.draw do
  get 'reports/new'
  get 'reviews/new'
  get 'requests/index'
  get 'clients/index'
  get 'chefs/index'
  devise_for :users, :controllers => {:registrations => "my_devise/registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get 'cities/:state', to: 'application#cities'

  # scope '/admins' do
  #   resources :users
  # end

  # resources :users do
    resources :clients do
      resources :requests
      resources :reports
    end
    resources :chefs do
      resources :galleries
      resources :services
    end
    # end
  resources :appointments do 
    resources :reviews
  end
    
  devise_scope :users do
    get '/client', to: 'clients#index', as: :client_root
    get '/client/:id', to: 'clients#profile', as: :client_profile
    get '/all_chefs', to: 'clients#all_chefs', as: :all_chefs
    put '/client/:id', to: 'clients#update_client'
    patch '/client/:id', to: 'clients#update_client'
    get '/client/:id/edit', to: 'clients#edit_client', as: :edit_client_profile

    get '/chef/:id', to: 'chefs#profile', as: :chef_profile
    get '/chef/:id/appointments', to: 'chefs#appointments', as: :chef_appointments
    get '/chef/:id/appointments/:id', to: 'chefs#notes_to_chef', as: :notes_to_chef
    get '/chef', to: 'chefs#index', as: :chef_root
    put '/chef/:id', to: 'chefs#update_chef'
    patch '/chef/:id', to: 'chefs#update_chef'
    get '/chef/:id/edit', to: 'chefs#edit_chef', as: :edit_chef_profile
    get '/chef/:id/appointments/:id/confirm', to: 'chefs#confirm_appointment', as: :confirm_appointment

    get '/admins', to: 'admins#index', as: :admin_root
    get '/admins/users', to: 'admins#all_users', as: :all_users
    get '/admins/reports', to: 'admins#reports'
    get '/admins/appointments', to: 'admins#appointments'
    get '/admins/transactions', to: 'admins#transactions'
    get '/admins/wallet', to: 'admins#admin_wallet'
    get '/admins/appointments/:id/release', to: 'admins#release_payment', as: :release_payment
    get '/admins/users/:id/suspend_chef', to: 'admins#suspend_chef', as: :suspend_chef
    get '/admins/users/:id/unsuspend_chef', to: 'admins#unsuspend_chef', as: :unsuspend_chef
    get '/admins/users/:id/suspend_client', to: 'admins#suspend_client', as: :suspend_client
    get '/admins/users/:id/unsuspend_client', to: 'admins#unsuspend_client', as: :unsuspend_client
  end

  get '/page-not-found', action: :error_page, controller: 'home'
  # get '*path', to: 'home#error_page'
  

  scope module: 'api', path: 'food', as: 'food' do
    get '/recipe/random', to: 'recipes#random'
  end
end
