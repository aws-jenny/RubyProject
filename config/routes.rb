Rails.application.routes.draw do

	#root "pages#index"

  devise_for :users, :path_prefix => 'dev', :controllers => {:registrations => 'registrations', :sessions => 'sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'

    authenticated :user do
      root 'pages#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, except: [:new, :create]
  
  resources :certificates do
    resources :trainings
  end

  resources :associations, :only => [:create, :destroy]
  resources :user_training_records, :only => [:create, :update, :destroy]
  resources :user_certificate_records, only: [:create, :update, :destroy] do
    resources :exam_histories, :only => [:create]
  end
  resources :recommendations, :only => [:create, :destroy]
  resources :business_units
  resources :categories
end
