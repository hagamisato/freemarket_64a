Rails.application.routes.draw do
  get 'credit_card/new'
  get 'credit_card/show'
  get 'cards/new'
  get 'cards/show'

  get 'purchases/index'
  get 'purchases/done'
  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "items#index"
  resources :items
  resources :item, only:[:index, :create, :new]
  resources :signups, only: [:index, :create] do
    collection do
      get :top
      get :reg
      get :tell
      get :add
      get :pay
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
  
  resources :cards, only: [:new, :show, :create, :destroy] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
 
  resources :mypage, only: [:imdex, :show] do
    collection do
      get :profile
      get :identification
      get :card
      get :logout
    end
  end

  resources :purchases, only: [:index, :show ] do
    member do
      post 'pay', to: 'purchases#pay'
      get :done
      end
  end
  
end
