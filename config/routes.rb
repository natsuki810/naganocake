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
   resources :items, only: [:new, :create, :index, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :genres, only: [:new, :create, :index, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get "/home/about" => "homes#about", as: "about"
    get "/customers/mypage" => "customers#show", as: "customer"
    get "/customers/mypage/edit" => "customers#edit"
    post "customers/confirm" => "customers#confirm"
    patch "customers/withdrawal" => "customers#withdrawal"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]do
      delete :destroy_all, on: :collection
    end
    resources :shopping_addresses, only: [:index, :create]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, only: [:new, :index]
  end
end
