Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  resources :portfolios, :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/admin', to: 'admin#index'
end
