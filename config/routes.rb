Rails.application.routes.draw do
  # get 'favorites/index'  #コメントアウト 0318 k.nomura
  # get 'sessions/new'  #コメントアウト 0318 k.nomura
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'pictures#index'
  resources :favorites, only: [:create, :destroy, :index]
end
