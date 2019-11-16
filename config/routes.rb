Rails.application.routes.draw do

  resources :cohorts do
    resources :blocks do 
      resources :attendances, shallow: true, only: [ :create, :destroy ]
      get :attended, on: :collection
    end
    resources :registrations, shallow: true, only: [ :create, :destroy ]
    get :registered, on: :collection
  end
  
  get('/users/:id/edit_password', {to: 'users#edit_password', as: :edit_password_user})
  patch('/users/:id/update_password', {to: 'users#update_password', as: :update_password_user})

  resources :users

  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
