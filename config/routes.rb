Rails.application.routes.draw do
  devise_for :users
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

  resources :mypage, only: [:imdex, :show] do
    collection do
      get :profile
      get :identification
      get :card
    end
  end
  
  get 'item/try', to: 'item#try' 
  # 何かを書いてみる為のページ用のルーティング
  
end
