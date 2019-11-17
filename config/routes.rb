Rails.application.routes.draw do

  resources :cohorts do
    resources :blocks do 
      resources :attendances, shallow: true, only: [ :destroy ]
      get :attended, on: :collection
    end
    resources :registrations, shallow: true, only: [ :create, :destroy, :new ]
    get :registered, on: :collection
  end
  
  get('/users/:id/edit_password', {to: 'users#edit_password', as: :edit_password_user})
  patch('/users/:id/update_password', {to: 'users#update_password', as: :update_password_user})
  post('/cohorts/:cohort_id/blocks/:id/attendances', {to: 'attendances#create', as: :cohort_block_attendances})


  resources :users

  resource :session, only: [:new, :create, :destroy]
  get('/', {to: 'home#index', as: :root})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
