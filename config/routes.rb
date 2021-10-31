Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
    # passwords:     'admins/passwords',
    # registrations: 'admins/registrations'
  }
  
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    resources :customers, only: [:edit, :update]
    get '/customers/mypage' => 'customers#show', as: 'mypage'
    get '/customers' => 'customers#comfirm', as: 'comfirm'
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  scope module: :admin do
    get 'admins/_list'
    get '/admin' => 'homes#top', as: 'top'
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end
  
  
end



