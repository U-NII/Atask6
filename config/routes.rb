Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about"=>"homes#about"
  resources :users
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :users
  resources :users do
   member do
    get :following, :followers
    end
  end
end