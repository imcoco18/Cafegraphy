Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resource :likes, only: [:create,:destroy,:index,:show]
    resources :post_comments, only: [:create,:destroy]
  end

  resources :users,only: [:show,:edit,:update] do
    collection do
         get 'quit'
         patch 'out'
    end
    member do
     get :following, :followers
    end
  end

  resources :categories,only: [:index,:edit,:update]
  resources :relationships, only: [:create,:destroy,:index,:show]

  root 'homes#home'
  get 'about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
