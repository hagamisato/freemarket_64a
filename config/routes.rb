Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only:[:new, :create, :show]
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

  resources :mypage, only: [:imdex, :show] do
    collection do
      get :profile
      get :identification
      get :card
      get :logout
    end
  end
end
