Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions" }

  root 'blogs#index'
  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end

  resources :blogs do
    resource :favorite, only: [:create, :destroy]
  end
end
