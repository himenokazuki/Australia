Rails.application.routes.draw do
root to: 'homes#top'
namespace :admin do
get 'users/show'  => "users#show"
get 'users/index' => "users#index"
get 'users/edit'  =>  "users#edit"
get 'posts/show'  =>  "posts#show"
get 'posts/index' => "posts#index"
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
  resources :posts, only: [:show , :destroy]
 end
   resources :posts, only: [:index, :new, :create]
 get 'users/confirm/:id'  => 'users#confirm'
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

