Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'

  resources :users,only: [:show,:index,:edit,:update]
  resources :blogs do
    resource :favorites,only: [:create, :destroy]
    resources :blog_comments,only: [:create, :destroy]
  end
  
end
