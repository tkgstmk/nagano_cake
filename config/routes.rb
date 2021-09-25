Rails.application.routes.draw do
 scope module: :admin do
  get '/admin' => 'homes#top', as: 'top'
 end



  devise_for :admins, controllers:{
    sessions:      'admin/sessions'
  }

  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  

 scope module: :public do
   root 'homes#top'
  # resources :homes, only: [:top]
  # get '/' => 'public/homes#top'
 end

  get 'public/_list'
  get 'public/homes/about' => 'public/homes#about', as: 'about'








  scope module: :public do
    get '/customers/mypage' => 'customers#show'
    resources :customers, only: [:edit, :update, :comfirm, :withdrawal]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
  end

  resources :customers, except: [:inde] do
    get :search, on: :collection
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update] do
      get :search, on: :collection
    end
    resources :oders, only: [:show]
    resources :customers, only: [:index, :edit, :show]
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
