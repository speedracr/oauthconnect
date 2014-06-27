Rails.application.routes.draw do
  devise_for :users#, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'users/auth/:provider/callback' => 'authentications#create'

  get 'pages/home'

  root 'pages#home'


  
end
