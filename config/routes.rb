# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/search'
  get 'pages/join'
  resources :scholars
  root 'pages#home'
end
