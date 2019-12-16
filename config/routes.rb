Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "item#index"
  resources :items, only:[:new, :create, :show]
  resources :item, only:[:index]
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

end
