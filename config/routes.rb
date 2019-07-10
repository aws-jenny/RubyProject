Rails.application.routes.draw do

  resources :certificates do
    resources :trainings
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end
end