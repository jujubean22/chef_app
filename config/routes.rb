Rails.application.routes.draw do
  get 'clients/index'
  get 'chefs/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  # scope '/admins' do
  #   resources :users
  # end

  resources :users do
    resources :clients
    resources :chefs
  end
  
  devise_scope :users do
    get '/admins', to: 'admins#index', as: :admin_root
  end

  get '/page-not-found', action: :error_page, controller: 'home'
  get '*path', to: 'home#error_page'
end
