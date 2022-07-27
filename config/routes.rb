Rails.application.routes.draw do
  get 'time/index'
  # 会員用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_scope :user do
  post 'users_guest_sign_in', to: 'public/sessions#guest_sign_in'
end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ########### 会員側のルーティング設定 ##########
  scope module: :public do
    root to: "homes#top"
    get '/home/about' => 'homes#about', as: 'about'
    resources :users, only: [:show, :edit, :destroy, :update, :create] do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end

    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get "search" => "searches#search"
    get 'chat/:id', to: 'chats#show', as: 'chat'
    resources :chats, only: [:create]
    resources :notifications, only: [:index] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :times, only: [:index]
  end

  ########## 管理者側のルーティング設定 ##########
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :destroy, :update]
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resources :post_comments, only: [:create]
    end
  end
end