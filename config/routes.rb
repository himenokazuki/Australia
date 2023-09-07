Rails.application.routes.draw do
root to: 'homes#top'
namespace :admin do
get 'users/show'  => "users#show"
get 'users/index' => "users#index"
get 'users/edit'  =>  "users#edit"
get 'posts/show'  =>  "posts#show"
get 'posts/index' => "posts#index"
resources :posts, only: [:destroy ]
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
  resources :users, only: [:edit, :show, :update, :destroy] do
    resources :posts, only: [:show ]
    #member do
    #  get 'posts'
    #  get 'favorites'
    #end
  end
  resources :posts, only: [:index, :new, :create, :destroy ]
  get 'users/confirm/:id'  => 'users#confirm'
  get 'posts/search'  => 'posts#search'
end
  resources :posts do
    resources :introduction, only: :create
    #member do
      #get 'search'
    #end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

