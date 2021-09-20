Rails.application.routes.draw do
  devise_for :admin, controllers:{
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  resources :admin do
    get :search, on: :collection
  end

  resources :customers do
    get :search, on: :collection
  end





  get 'public/_list'
  get 'public/about' => 'public#about', as: 'about'




  scope module: :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
 
  get '/admin' => 'admin#homes', as: 'top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
