Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  get '/admin' => 'homes#top', as: '_admin'

  get 'customers/_list'

  get 'search' => 'posts#search'

  resource :genres, only: [:index, :create, :edit, :update]
  resource :items, only: [:index, :new, :create, :show, :edit, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
