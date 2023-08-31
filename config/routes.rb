Rails.application.routes.draw do
root to: 'homes#top'
namespace :admin do
get 'users/show'  => "users#show"
get 'users/index' => "users#index"
get 'users/edit'  =>  "users#edit"
get 'posts/show'  =>  "posts#show"
get 'posts/index' => "posts#index"
end

namespace :users do
get 'user/show'     => 'user#show'
get 'user/edit'     => 'user#edit'
patch 'user/update' => 'user#update'
get 'user/confirm'  => 'user#confirm'
get 'posts/index'   => 'posts#index'
get 'posts/show'    => 'posts#show'
end


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
sessions: "admin/sessions"
}

devise_for :users, controllers: {
registrations: "users/registrations",
sessions: 'users/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

