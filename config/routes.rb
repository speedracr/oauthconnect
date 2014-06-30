Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'users/auth/:provider/callback' => 'authentications#create'

  get 'pages/home'
  get 'pages/task'
  get 'pages/createtask'

  get 'task', to: 'pages#task'
  root 'pages#home'


  
end
