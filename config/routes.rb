Rails.application.routes.draw do
  get 'credit_card/new'
  get 'credit_card/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "item#index"
  resources :item, only:[:index, :create, :new, :show]
  resources :signup, only: [:index, :create] do
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
  
  get 'item/try', to: 'item#try' 
  # 何かを書いてみる為のページ用のルーティング
  
end
