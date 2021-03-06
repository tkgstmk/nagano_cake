Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
    # passwords:     'admins/passwords',
    # registrations: 'admins/registrations'
  }
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    resource :customers, only: [:edit, :update]
    get '/customers/mypage' => 'customers#show', as: 'mypage'
    get '/customers/confirm' => 'customers#comfirm', as: 'comfirm'
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete '/cart_items' => 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    resources :orders, only: [:new, :create, :index, :show]
  end
  
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  
  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
    get '/admin' => 'homes#top', as: 'top'
  end
  
  
end



