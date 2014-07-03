Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'users/auth/:provider/callback' => 'authentications#create'

  get 'pages/home'
  get 'tasks/new'
  post 'tasks/create'

  get 'task', to: 'tasks#new'
  root 'pages#home'

  get 'asana/workspaces/:workspace_id/projects' => "asana#projects"
  
end
