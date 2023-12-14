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
   resources :items, only: [:index]
   resources :customers, only: [:index]
   resources :genres, only: [:index]
  end

  scope module: :public do
    root to: 'homes#top'
    get "/home/about" => "homes#about", as: "about"
    get "/customers/mypage" => "customers#show", as: "customer"
    get "/customers/mypage/edit" => "customers#edit"
    resources :items, only: [:index]
    resources :cart_items, only: [:index]
    resources :shopping_addresses, only: [:index]
    resources :orders, only: [:index]
  end
end
