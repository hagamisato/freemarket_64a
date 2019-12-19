Rails.application.routes.draw do
  get 'cards/new'
  get 'cards/show'
  get 'purchases/index'
  get 'purchases/done'
  devise_for :users
  root "items#index"
  resources :items
  resources :item, only:[:index, :create, :new]
  resources :signups, only: [:index, :create] do
    collection do
      get :top
      get :reg
      get :tell
      get :add
      get :finish
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

  resources :purchases, only: [:index ]do
    collection do
    get :done
    end
  end
  
end
