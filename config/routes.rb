Rails.application.routes.draw do
  get 'clients/index'
  get 'chefs/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
