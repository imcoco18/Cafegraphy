Rails.application.routes.draw do

  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  resources :posts do
    resource :likes, only: [:create,:destroy]
    resources :post_comments, only: [:create,:destroy]
      collection do
        get 'search' => 'posts#search'
      end
  end

  resources :users,only: [:index,:show,:edit,:update,:destroy] do
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
