Rails.application.routes.draw do
  resources :user_courses
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'


  get 'missing/courses', to:'user_courses#missing'
  get 'done/courses', to:'user_courses#done'
  patch 'done/courses/patch', to:'user_courses#toggle'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
