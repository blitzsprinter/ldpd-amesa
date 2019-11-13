# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end
  get 'pages/home'
  get 'pages/about'
  get 'pages/search'
  get 'pages/join'
  resources :regions, except: [:new, :create, :destroy]
  resources :countries, except: [:new, :create, :destroy]
  resources :scholars
  resources :pending_scholars, only: [:index, :edit]
  resources :scholar_edits, except: [:show]
  get '/scholars/regions/:id', to: 'scholars#by_region_of_study', as: 'by_regions'
  get 'search', to: 'scholars#search', as: 'search'
  # Google Custom Search
  get 'gcssearch', to: 'scholars#gcs_search', as: 'gcs_search'
  # fcd1, 11/01/19: Following routes accommodate urls from the legacy app
  # BEGIN>>>>
  get '/scholars/view/:id', to: 'scholars#show'
  get '/scholars/index/africa', to: 'scholars#by_region_of_study', id: 1
  get '/scholars/index/middle_east', to: 'scholars#by_region_of_study', id: 2
  get '/scholars/index/south_asia', to: 'scholars#by_region_of_study', id: 3
  # <<<<<<END
  root 'pages#home'
end
