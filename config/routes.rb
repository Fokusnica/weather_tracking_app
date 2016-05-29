Rails.application.routes.draw do
  get 'sign_up' => 'sessions#sign_up_form', as: 'sessions_sign_up'
  post 'sign_up' => 'sessions#sign_up'
  get 'sign_in' => 'sessions#sign_in_form', as: 'sessions_sign_in'
  post 'sign_in' => 'sessions#sign_in'

  get 'sessions/sign_out'
  get 'index' => 'welcome#index'
  resources :cities
  root 'welcome#index'
  patch 'city_update' => 'cities#update', as: 'city_update'
end
