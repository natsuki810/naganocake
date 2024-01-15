Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :admin do
   get "top" => "homes#top", as: "top"
   resources :orders, only: [:show, :update]
   get "/orders/customers/:id" => "orders#index"
   resources :order_details, only: [:update]
   resources :items, only: [:new, :create, :index, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :genres, only: [:new, :create, :index, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get "/home/about" => "homes#about", as: "about"
    get "/customers/mypage" => "customers#show", as: "customer"
    get "/customers/mypage/edit" => "customers#edit"
    patch "/customers/mypage" => "customers#update"
    get "customers/confirm" => "customers#confirm"
    patch "customers/withdrawal" => "customers#withdrawal"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]do
      delete :destroy_all, on: :collection
    end
    resources :shopping_addresses, only: [:new, :index, :create, :edit, :update, :destroy]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new, :index, :show, :create]
  end
end
