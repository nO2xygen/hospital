Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :appointments
  resources :doctors
  resources :specialties
  resources :patients
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
