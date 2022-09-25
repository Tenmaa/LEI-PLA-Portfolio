Rails.application.routes.draw do
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

# 顧客用
# URL /users/sign_in ...
devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

devise_scope :user do
    post 'users/guest_sign_in' => 'user/sessions#guest_sign_in'
  end
  
  # adminのURLの取得
  get 'admin' => "admin/homes#top"
  
  namespace :admin do
    resources :games, only:[:index, :create, :show, :destroy, :new, ]
    resources :genres, only:[:index, :new, :create, :destroy]
    resources :geme_herd, only:[:index, ]
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
