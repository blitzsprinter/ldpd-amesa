# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/search'
  get 'pages/join'
  resources :regions
  resources :countries
  resources :scholars
  resources :scholar_edits
  get '/scholars/regions/:id', to: 'scholars#by_region_of_study', as: 'by_regions'
  root 'pages#home'
end
