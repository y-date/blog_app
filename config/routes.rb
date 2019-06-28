Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions" }

  root 'blogs#index'

  resources :blogs do
    resource :favorite, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end
end
