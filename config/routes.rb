Rails.application.routes.draw do
  devise_for :admin, controllers:{
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :public, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  get '/admin' => 'homes#top', as: '_admin'

  get 'public/_list'
  get 'public/about' => 'public#about', as: 'about'


  get 'search' => 'posts#search'

  scope module: :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
