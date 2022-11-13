Rails.application.routes.draw do
  namespace :admin do
    get 'users/show'
  end
  namespace :user do
    get 'customers/show'
  end
  namespace :user do
    get 'game_hards/index'
  end
  namespace :user do
    get 'genres/index'
  end
  namespace :user do
    get 'games/index'
    get 'games/show'
  end
  root :to => 'user/homes#top'
  get 'users' => redirect("/users/sign_up")
  namespace :user do
    get 'homes/top'
  end
  namespace :admin do
    get 'game_hards/index'
  end
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
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
  
  # adminのURLの取得
  get 'admin' => "admin/homes#top"
  
  namespace :admin do
    resources :games, only:[:index, :create, :show, :destroy, :new, ]
    resources :genres, only:[:index, :new, :create, :destroy]
    resources :game_hards, only: [:index, :new, :create, :destroy]
    resources :users, only: [:show, :destroy]
  end
  
  delete '/user/users/:game_rakuten_jan_code/comments/:id', to: 'user/users#destroy_comment', as: 'user_users_destroy_comment'
  
  delete '/admin/users/:game_rakuten_jan_code/comments/:id', to: 'admin/users#destroy_comment', as: 'admin_users_destroy_comment'
  
  namespace :user do
    resources :homes, only: [:top]
    resources :games, only:[:index, :create, :show, :destroy, :new, ]
    resources :users, only: [:show, :edit, :update, :destroy,]

    
    resources :games, param: :rakuten_jan_code do
      resources :comments, only: [:index, :create, :destroy]
    end
  
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
