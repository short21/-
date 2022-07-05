Rails.application.routes.draw do

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
  end
  

  ########## 管理者側のルーティング設定 ##########
  namespace :admin do

  end
end
