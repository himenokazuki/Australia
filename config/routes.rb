Rails.application.routes.draw do
  root to: 'public/homes#top'

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'user/sessions'
  }
 
 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

