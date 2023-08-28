Rails.application.routes.draw do
  namespace :admin do
    get 'users/show'
    get 'users/index'
    get 'users/edit'
  end
  namespace :admin do
    get 'posts/show'
    get 'posts/index'
  end
  root 'homes#top'
  # namespace :users do
  #   get 'user/show　'
  #   get 'user/edit'
  #   get 'user/update'
  #   get 'user/confirm'
  # end
  # namespace :users do
  #   get 'posts/index'
  #   get 'posts/show'
  # end
  

  # devise_for :admin, controllers: {
  # sessions: "admin/sessions"
  # }
  
  # devise_for :users, controllers: {
  # registrations: "users/registrations",
  # sessions: 'user/sessions'
  # }
 
 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

