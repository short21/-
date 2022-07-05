Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  # 会員用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ########### 会員側のルーティング設定 ##########
  namespace :public do
    resources :users, only: [:show, :edit, :destroy, :update]
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resources :post_comments, only: [:create]
    end

  end


  ########## 管理者側のルーティング設定 ##########
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :destroy, :update]
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resources :post_comments, only: [:create]
    end
  end
end
