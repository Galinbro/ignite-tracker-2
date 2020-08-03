Rails.application.routes.draw do
  resources :user_courses
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  get 'courses', to:'home#courses'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
