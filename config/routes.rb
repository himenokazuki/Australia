Rails.application.routes.draw do
root to: 'homes#top'
namespace :admin do
get 'users/:id/show'  => "users#show", as: "users_show"
get 'users/index' => "users#index"
get 'users/edit'  =>  "users#edit"
patch 'users/:id/reactivate' => "users#reactivate", as: "reactivate"
get 'posts/show'  =>  "posts#show"
get 'posts/index' => "posts#index"

resources :posts, only: [:destroy ]
resources :users, only: [:destroy ,:update]
get 'homes/top'
    delete '/admin/sign_out'=>'sessions#destroy'
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
sessions: "admin/sessions"
}

devise_for :users, controllers: {
registrations: "users/registrations",
sessions: 'users/sessions'
}

namespace :users do
  get 'users/confirm/:id'  => 'users#confirm' 
  resources :users, only: [:edit, :show, :update, :destroy, :index] do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end
    # resources :posts, only: [:show ]
    #member do
    #  get 'posts'
    #  get 'favorites'
    #end
  get 'posts/search'  => 'posts#search'
  resources :posts, only: [:index, :new, :show, :create, :destroy]
   patch 'users/comments/:id' => "users#comments", as: "comments"
end

  # TODO: ルーティングで不具合が発生したら戻すところ
  # resources :posts do
  #   resources :introduction, only: :create
  #   #member do
  #     #get 'search'
  #   #end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

