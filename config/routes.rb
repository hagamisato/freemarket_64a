Rails.application.routes.draw do
  get 'credit_card/new'
  get 'credit_card/show'
  get 'purchases/index'
  get 'purchases/done'
  devise_for :users,
  controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "items#index"
  resources :items, only:[:new, :create, :show, :index]
  resources :signups, only: [:index, :create] do
    collection do
      get :top
      get :reg
      get :tell
      get :add
      get :finish
    end
  end


  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
  
  get 'item/try', to: 'item#try' 
  # 何かを書いてみる為のページ用のルーティング
  resources :mypage, only: [:imdex, :show] do
    collection do
      get :profile
      get :identification
      get :card
      get :logout
    end
  end

  resources :purchases, only: :index do
    collection do
    get :done
    end
  end
  
end
