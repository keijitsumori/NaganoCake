Rails.application.routes.draw do
  
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords,],controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
    
  root 'customer/homes#top'
  get 'about' => 'customer/homes#about'

  scope module: :customer do
    resources :items, only: [:index, :show]

    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]

    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/comfirm' => 'orders#comfirm'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    patch 'orders/:order_id/order_details/:id' => 'order_details#update'
    resources :orders, only: [:index ,:show, :update]
  end
end
