Rails.application.routes.draw do

  resources :cohorts do
    resources :blocks do 
      resources :attendances, shallow: true, only: [ :create, :destroy ]
      get :attended, on: :collection
    end
    resources :registrations, shallow: true, only: [ :create, :destroy ]
    get :registered, on: :collection
  end
  


  resources :users

  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
