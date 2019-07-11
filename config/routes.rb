Rails.application.routes.draw do

	root "pages#index"

  devise_for :users, :path_prefix => 'dev', :controllers => {:registrations => 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end

  resources :users
  resources :certificates do
    resources :trainings
  end
end
