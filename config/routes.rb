Rails.application.routes.draw do

  root 'static_pages#index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  resources :users

  namespace :api do
     namespace :v1 do
       resources :user_days, :users
    end
  end

end
